class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :year
  belongs_to_active_hash :month
  belongs_to_active_hash :day
end
