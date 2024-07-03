class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_date
  has_one_attached :image

  validates :item_name, :description, :image, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_date_id,
            presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_date_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
