class Profile < ApplicationRecord
  belongs_to :user
  ZIP_CODE_VALID = /\A\d{3}-\d{4}\z/i

  validates :birth_year,              presence: true
  validates :birth_month,             presence: true
  validates :birth_day,               presence: true
  validates :last_name,               presence: true, length: {maximum: 20}
  validates :first_name,              presence: true, length: {maximum: 20}
  validates :last_name_kana,          presence: true, length: {maximum: 20}
  validates :first_name_kana,         presence: true, length: {maximum: 20}
  validates :zip_code,                presence: true, length: {maximum: 20}, format: { with: ZIP_CODE_VALID }
  validates :prefecture,              presence: true, length: {maximum: 20}
  validates :city,                    presence: true, length: {maximum: 50}
  validates :house_number,            presence: true, length: {maximum: 100}
  validates :phone_number,            length: {maximum: 100}
end
