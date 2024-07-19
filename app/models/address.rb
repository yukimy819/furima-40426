class Address < ApplicationRecord
  belongs_to :record
  belongs_to :user, foreign_key: 'user_id'
end
