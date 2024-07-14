FactoryBot.define do
  factory :record_address do
    postal_code    { '123-4567' }
    area_id        { 2 }
    municipality   { '東京都' }
    street_address { '1-1' }
    building_name  { '東京ハイツ' }
    phone_number   { '09011111111' }
    association :user
    association :item
  end
end
