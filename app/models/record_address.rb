class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area, :municipality, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :street_address
    validates :phone_number, length: {minimum: 10, maximum: 11}, format: {with: VALID_PHONE_REGEX }
    validates :user_id
    validates :item_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area: area, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end