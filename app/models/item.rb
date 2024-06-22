class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_date
  has_one_attached :image

  validates :item_name, :price, :description, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_date_id, presence: true
  validates :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank" }
end
