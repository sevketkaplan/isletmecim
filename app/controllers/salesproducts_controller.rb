class SalesproductsController < ApplicationController
  before_action :set_salesproduct, only: [:show, :edit, :update, :destroy]
  before_action :set_customerbalance,only: [:edit, :update]
  # GET /salesproducts
  # GET /salesproducts.json
  def index
    @salesproducts = Salesproduct.all
  end

  # GET /salesproducts/1
  # GET /salesproducts/1.json
  def show
  end

  # GET /salesproducts/new
  def new
    @salesproduct = Salesproduct.new
  end

  # GET /salesproducts/1/edit
  def edit
  end

  # POST /salesproducts
  # POST /salesproducts.json
  def create
    @salesproduct = Salesproduct.new(salesproduct_params)
    @salesproduct.user_id=current_user.id
    @product=Product.find(@salesproduct.product_id)
    @salesproduct.total_price=@product.unit_price*@salesproduct.unit


    respond_to do |format|
      if @salesproduct.save
        @product.amount-=@salesproduct.unit
        @product.save

        if Customerbalance.exists?(user_id: @salesproduct.user_id)
          @customerbalance=Customerbalance.find_by_user_id(@salesproduct.user_id)

          @customerbalance.user_id=@salesproduct.user_id
          @customerbalance.total_balance+=@salesproduct.total_price
          @customerbalance.save
        else
          @customerbalance=Customerbalance.new(:user_id=>@salesproduct.user_id,:total_balance=> @salesproduct.total_price)
          @customerbalance.save
        end

        format.html { redirect_to @salesproduct, notice: 'Salesproduct was successfully created.' }
        format.json { render :show, status: :created, location: @salesproduct }     
      else
        format.html { render :new }
        format.json { render json: @salesproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salesproducts/1
  # PATCH/PUT /salesproducts/1.json
  def update
    @customerbalance=Customerbalance.find_by_user_id(@salesproduct.user_id)
    @customerbalance.total_balance-=@salesproduct.total_price
    @customerbalance.save

    respond_to do |format|
      if @salesproduct.update(salesproduct_params)
       @customerbalance.total_balance+=@salesproduct.total_price
       @customerbalance.save
       format.html { redirect_to @salesproduct, notice: 'Salesproduct was successfully updated.' }
       format.json { render :show, status: :ok, location: @salesproduct }
     else
      format.html { render :edit }
      format.json { render json: @salesproduct.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /salesproducts/1
  # DELETE /salesproducts/1.json
  def destroy
    @salesproduct.destroy
    @customerbalance=Customerbalance.find_by_user_id(@salesproduct.user_id)
    @customerbalance.total_balance-=@salesproduct.total_price
    @customerbalance.save

    respond_to do |format|
      format.html { redirect_to salesproducts_url, notice: 'Salesproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salesproduct
      @salesproduct = Salesproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salesproduct_params
      params.require(:salesproduct).permit(:product_id,:unit, :total_price)
    end
    def set_customerbalance
      @customerbalance = Customerbalance.find(params[:id])
    end
    def customerbalance_params
      
    end
  end
