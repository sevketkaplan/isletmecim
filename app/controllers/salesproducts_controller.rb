class SalesproductsController < ApplicationController
  before_action :set_salesproduct, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @salesproduct.save
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
    respond_to do |format|
      if @salesproduct.update(salesproduct_params)
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
      params.require(:salesproduct).permit(:unit, :total_price)
    end
end
