class Item < ApplicationRecord
  validates :item_name, :price, :description, :category, :condition, :delivery_fee_id, :area_id, :delivery_date_id, presence: true
  belongs_to :user
end
