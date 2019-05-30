class BasketsController < ApplicationController
  before_action :admin_check, only: [:edit,:update,:destroy,:new,:create]
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  # GET /baskets.json
  def index

    if params[:user_id]==nil
      @user=current_user
      @baskets=Basket.all.order("created_at DESC")
    else
      @user=User.find(params[:user_id])
      @baskets=Basket.where(user_id: params[:user_id]).order("created_at DESC")
    end
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  # POST /baskets
  # POST /baskets.json
  def create
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...11).map { o[rand(o.length)] }.join
    @basket = Basket.new(basket_params)
    
    @basket.key=string

    respond_to do |format|
      if @basket.save


        format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
        format.json { render :show, status: :created, location: @basket }
      else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...11).map { o[rand(o.length)] }.join
    @basket.key=string
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: 'Basket was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.salesproducts.each do |item|
      item.destroy
    end
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_params
      params.require(:basket).permit(:key,:user_id)
    end
  end
