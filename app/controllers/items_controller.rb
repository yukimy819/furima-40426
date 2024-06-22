class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category, :condition, :delivery_fee_id, :area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
