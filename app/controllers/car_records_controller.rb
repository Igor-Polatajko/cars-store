class CarRecordsController < ApplicationController

  before_action :set_car_record, only: [:show, :edit, :update, :destroy]

  # GET /car_records
  # GET /car_records.json
  def index
    @car_records = CarRecord.order(created_at: :desc)
  end

  # GET /car_records/1
  # GET /car_records/1.json
  def show
  end

  # GET /car_records/new
  def new
    @car_record = CarRecord.new
  end

  # GET /car_records/1/edit
  def edit
  end

  # POST /car_records
  # POST /car_records.json
  def create
    @car_record = CarRecord.new(car_record_params)

    @car_record.user = current_user

    respond_to do |format|
      if @car_record.save
        format.html { redirect_to @car_record, notice: 'Car record was successfully created.' }
        format.json { render :show, status: :created, location: @car_record }
      else
        format.html { render :new }
        format.json { render json: @car_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_records/1
  # PATCH/PUT /car_records/1.json
  def update
    respond_to do |format|
      if @car_record.update(car_record_params)
        format.html { redirect_to @car_record, notice: 'Car record was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_record }
      else
        format.html { render :edit }
        format.json { render json: @car_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_records/1
  # DELETE /car_records/1.json
  def destroy
    @car_record.destroy
    respond_to do |format|
      format.html { redirect_to car_records_url, notice: 'Car record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_record
      @car_record = CarRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_record_params
      params.require(:car_record).permit(:title, :description, :price, images:[])
    end
end
