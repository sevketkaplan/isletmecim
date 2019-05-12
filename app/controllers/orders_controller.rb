class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @all_orders=Order.all.order('created_at DESC')
    @user_orders=Order.where(user_id: current_user.id)
    @orders = @user_orders.all.order('created_at DESC')
    @order = Order.new
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...11).map { o[rand(o.length)] }.join
    @order = Order.new(order_params)
    @order.user=current_user
    @order.req_key=string
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
   o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
   string = (0...11).map { o[rand(o.length)] }.join

   respond_to do |format|
    
    if @order.update(order_params)
      @order.req_key=string
      @order.save
      format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      format.json { render :show, status: :ok, location: @order }
    else
      format.html { render :edit }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.reqitems.each do |reqitem|
      reqitem.destroy
    end
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:req_key)
    end
  end
