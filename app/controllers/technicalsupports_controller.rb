class TechnicalsupportsController < ApplicationController
  before_action :set_technicalsupport, only: [:show, :edit, :update, :destroy]


  def index
    @technicalsupports = Technicalsupport.all.order("created_at DESC")
  end

  
  def show
  end

  def new

    @technicalsupport = Technicalsupport.new
    @user=User.find(params[:u_id])
  end

  def edit
  end


  def create
   o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
   string = (0...11).map { o[rand(o.length)] }.join
   @technicalsupport = Technicalsupport.new(technicalsupport_params)

   @technicalsupport.key=string


   respond_to do |format|
    if @technicalsupport.save

      if Customerbalance.exists?(user_id: @technicalsupport.user_id)
        @customerbalance=Customerbalance.find_by_user_id(@technicalsupport.user_id)

        @customerbalance.user_id=@technicalsupport.user_id
        @customerbalance.total_balance+=@technicalsupport.workmanship_price
        @customerbalance.save
      else
        @customerbalance=Customerbalance.new(:user_id=>@technicalsupport.user_id,:total_balance=> @technicalsupport.workmanship_price)
        @customerbalance.save
      end
      format.html { redirect_to @technicalsupport, notice: 'Technicalsupport was successfully created.' }
      format.json { render :show, status: :created, location: @technicalsupport }
    else
      format.html { render :new }
      format.json { render json: @technicalsupport.errors, status: :unprocessable_entity }
    end
  end
end


def update

 @customerbalance=Customerbalance.find_by_user_id(@technicalsupport.user_id)
 @customerbalance.total_balance-=@technicalsupport.workmanship_price
 @customerbalance.save
 respond_to do |format|
  if @technicalsupport.update(technicalsupport_params)
   @customerbalance.total_balance+=@technicalsupport.workmanship_price
   @customerbalance.save
   format.html { redirect_to @technicalsupport, notice: 'Technicalsupport was successfully updated.' }
   format.json { render :show, status: :ok, location: @technicalsupport }
 else
  format.html { render :edit }
  format.json { render json: @technicalsupport.errors, status: :unprocessable_entity }
end
end
end

def destroy
  @technicalsupport.destroy
  respond_to do |format|
    format.html { redirect_to technicalsupports_url, notice: 'Technicalsupport was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
def set_technicalsupport
  @technicalsupport = Technicalsupport.find(params[:id])
end

def technicalsupport_params
  params.require(:technicalsupport).permit(:workmanship_price, :total_price, :description,:key,:user_id)
end
end
