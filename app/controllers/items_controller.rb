class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category_id, :condition_id, :delivery_fee_id, :area_id,
                                 :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
