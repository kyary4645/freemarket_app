class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :credits
  has_one :profile, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: {minimum: 7, maximum: 15}, format: { with: PASSWORD_VALIDATION }
  validates :nickname, presence: true, length: {maximum: 15}

  has_many :items

end
