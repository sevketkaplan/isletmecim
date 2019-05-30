class CustomerbalancesController < ApplicationController
  before_action :admin_check
  before_action :set_customerbalance, only: [:show, :edit, :update, :destroy]

  
  # GET /customerbalances
  # GET /customerbalances.json
  def index
    @customerbalances = Customerbalance.all
  end

  # GET /customerbalances/1
  # GET /customerbalances/1.json
  def show
  end

  # GET /customerbalances/new
  def new
    @customerbalance = Customerbalance.new
  end

  # GET /customerbalances/1/edit
  def edit
  end

  # POST /customerbalances
  # POST /customerbalances.json
  def create
    @customerbalance = Customerbalance.new(customerbalance_params)

    respond_to do |format|
      if @customerbalance.save
        format.html { redirect_to @customerbalance, notice: 'Customerbalance was successfully created.' }
        format.json { render :show, status: :created, location: @customerbalance }
      else
        format.html { render :new }
        format.json { render json: @customerbalance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customerbalances/1
  # PATCH/PUT /customerbalances/1.json
  def update
    respond_to do |format|
      if @customerbalance.update(customerbalance_params)
        format.html { redirect_to @customerbalance, notice: 'Customerbalance was successfully updated.' }
        format.json { render :show, status: :ok, location: @customerbalance }
      else
        format.html { render :edit }
        format.json { render json: @customerbalance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customerbalances/1
  # DELETE /customerbalances/1.json
  def destroy
    @customerbalance.destroy
    respond_to do |format|
      format.html { redirect_to customerbalances_url, notice: 'Customerbalance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customerbalance
      @customerbalance = Customerbalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customerbalance_params
      params.require(:customerbalance).permit(:total_balance)
    end
  end
