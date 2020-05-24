class CarRecordsController < ApplicationController
  before_action :user_only, only: [:new, :create, :current_user_car_records]
  before_action :owner_only, only: [:edit, :update]
  before_action :owner_or_admin, only: [:destroy]

  helper_method :is_guest, :is_owner, :is_admin

  before_action :set_car_record, only: [:show, :edit, :update, :destroy]

  def index
    @car_records = CarRecord.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def search
    if params[:q].nil? || params[:q].empty?
      return redirect_to main_page_index_path
    end

    @car_records = CarRecord.where("title like ?", "%#{params[:q]}%")
                            .order(views_count: :desc)
                            .paginate(page: params[:page], per_page: 3)
  end

  def show_current_user_car_records
    @car_records = CarRecord.where(user_id: @current_user.id)
                            .order(created_at: :desc)
                            .paginate(page: params[:page], per_page: 3)
  end

  def show
    @car_record.increment!(:views_count)
  end

  def new
    @car_record = CarRecord.new
  end

  def edit
  end

  def create
    @car_record = CarRecord.new(car_record_params)

    @car_record.user = @current_user

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

  def destroy
    @car_record.destroy
    respond_to do |format|
      format.html { redirect_to current_user_car_records_path, notice: 'Car record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_car_record
      @car_record = CarRecord.find(params[:id])
    end

    def car_record_params
      params.require(:car_record).permit(:title, :description, :price, images:[])
    end
end
