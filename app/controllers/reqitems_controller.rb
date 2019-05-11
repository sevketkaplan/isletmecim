class ReqitemsController < ApplicationController
  before_action :set_reqitem, only: [:show, :edit, :update, :destroy]
  before_action :set_order
  # GET /reqitems
  # GET /reqitems.json
  def index
    @reqitems = Reqitem.all
  end

  # GET /reqitems/1
  # GET /reqitems/1.json
  def show
  end

  # GET /reqitems/new
  def new
    @products=Product.all
    @reqitem = @order.reqitems.new
  end

  # GET /reqitems/1/edit
  def edit
  end

  # POST /reqitems
  # POST /reqitems.json
  def create
    @reqitem = @order.reqitems.build(reqitem_params)
    respond_to do |format|
      if @reqitem.save
        format.js
        format.html { redirect_to @reqitem, notice: 'Reqitem was successfully created.' }
        format.json { render :show, status: :created, location: @reqitem }
      else
        format.html { render :new }
        format.json { render json: @reqitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reqitems/1
  # PATCH/PUT /reqitems/1.json
  def update
    respond_to do |format|
      if @reqitem.update(reqitem_params)
        format.html { redirect_to reqitems_url, notice: 'Reqitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @reqitem }
      else
        format.html { render :edit }
        format.json { render json: @reqitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reqitems/1
  # DELETE /reqitems/1.json
  def destroy
    @reqitem.destroy
    respond_to do |format|
      format.html { redirect_to reqitems_url, notice: 'Reqitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order=Order.find(params[:order_id])
      #@comment = @post.comments.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_reqitem
      @reqitem = @order.reqitems.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reqitem_params
      params.require(:reqitem).permit(:product_id,:amount)
    end
  end
