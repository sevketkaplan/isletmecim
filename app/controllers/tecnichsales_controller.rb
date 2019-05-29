class TecnichsalesController < ApplicationController
  before_action :set_tecnichsale, only: [:show, :edit, :update, :destroy]
  before_action :set_customerbalance,only: [:edit, :update]
  before_action :set_technicalsupport

  # GET /tecnichsales
  # GET /tecnichsales.json
  def index
    @tecnichsales = Tecnichsale.all.order("created_at DESC")
  end

  # GET /tecnichsales/1
  # GET /tecnichsales/1.json
  def show
  end

  # GET /tecnichsales/new
  def new
    @tecnichsale = Tecnichsale.new
  end

  # GET /tecnichsales/1/edit
  def edit
  end

  # POST /tecnichsales
  # POST /tecnichsales.json
 def create
    @tecnichsale = @technicalsupport.tecnichsales.build(tecnichsale_params)
    @tecnichsale.user_id=@technicalsupport.user_id
    @product=Product.find(@tecnichsale.product_id)
    @tecnichsale.total_price=@product.unit_price*@tecnichsale.unit


    respond_to do |format|
      if @tecnichsale.save
        @product.amount-=@tecnichsale.unit
        @product.save

        if Customerbalance.exists?(user_id: @tecnichsale.user_id)
          @customerbalance=Customerbalance.find_by_user_id(@tecnichsale.user_id)

          @customerbalance.user_id=@tecnichsale.user_id
          @customerbalance.total_balance+=@tecnichsale.total_price
          @customerbalance.save
        else
          @customerbalance=Customerbalance.new(:user_id=>@tecnichsale.user_id,:total_balance=> @tecnichsale.total_price)
          @customerbalance.save
        end
        format.js
        format.html { redirect_to @tecnichsale_edit, notice: 'tecnichsale was successfully created.' }
        format.json { render :show, status: :created, location: @tecnichsale }     
      else
        format.html { render :new }
        format.json { render json: @tecnichsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tecnichsales/1
  # PATCH/PUT /tecnichsales/1.json
   def update
    @customerbalance=Customerbalance.find_by_user_id(@tecnichsale.user_id)
    @customerbalance.total_balance-=@tecnichsale.total_price
    @customerbalance.save

    respond_to do |format|
      if @tecnichsale.update(tecnichsale_params)
       @customerbalance.total_balance+=@tecnichsale.total_price
       @customerbalance.save
       format.html { redirect_to @tecnichsale, notice: 'tecnichsale was successfully updated.' }
       format.json { render :show, status: :ok, location: @tecnichsale }
     else
      format.html { render :edit }
      format.json { render json: @tecnichsale.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /tecnichsales/1
  # DELETE /tecnichsales/1.json
  def destroy
    @product=Product.find(@tecnichsale.product_id)
    @product.amount+=@tecnichsale.unit
    @product.save
    @customerbalance=Customerbalance.find_by_user_id(@tecnichsale.user_id)
    @customerbalance.total_balance-=@tecnichsale.total_price
    @customerbalance.save
    
    @tecnichsale.destroy
    
    respond_to do |format|
      format.html { redirect_to tecnichsales_url, notice: 'tecnichsale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_technicalsupport
    @technicalsupport=Technicalsupport.find(params[:technicalsupport_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_tecnichsale
      @tecnichsale = Tecnichsale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tecnichsale_params
      params.require(:tecnichsale).permit(:unit, :total_price,:product_id,:workmanship_price)
    end
    def set_customerbalance
      @customerbalance = Customerbalance.find(params[:id])
    end
  end
