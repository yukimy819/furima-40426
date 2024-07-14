class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @record_address = RecordAddress.new
  end

  def new
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:postal_code, :area, :municipality, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
