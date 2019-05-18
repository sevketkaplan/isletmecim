class FaultreqsController < ApplicationController
  before_action :set_faultreq, only: [:show, :edit, :update, :destroy]

  # GET /faultreqs
  # GET /faultreqs.json
  def index
    @faultreqs = Faultreq.all
  end

  # GET /faultreqs/1
  # GET /faultreqs/1.json
  def show
  end

  # GET /faultreqs/new
  def new
    @faultreq = Faultreq.new
  end

  # GET /faultreqs/1/edit
  def edit
  end

  # POST /faultreqs
  # POST /faultreqs.json
  def create
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...11).map { o[rand(o.length)] }.join
    @faultreq = Faultreq.new(faultreq_params)
    @faultreq.user=current_user
    @faultreq.key=string
    respond_to do |format|
      if @faultreq.save
        format.html { redirect_to @faultreq, notice: 'Faultreq was successfully created.' }
        format.json { render :show, status: :created, location: @faultreq }
      else
        format.html { render :new }
        format.json { render json: @faultreq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faultreqs/1
  # PATCH/PUT /faultreqs/1.json
  def update
    respond_to do |format|
      if @faultreq.update(faultreq_params)
        format.html { redirect_to @faultreq, notice: 'Faultreq was successfully updated.' }
        format.json { render :show, status: :ok, location: @faultreq }
      else
        format.html { render :edit }
        format.json { render json: @faultreq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faultreqs/1
  # DELETE /faultreqs/1.json
  def destroy
    @faultreq.destroy
    respond_to do |format|
      format.html { redirect_to faultreqs_url, notice: 'Faultreq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faultreq
      @faultreq = Faultreq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faultreq_params
      params.require(:faultreq).permit(:description,:image,:key)
    end
end
