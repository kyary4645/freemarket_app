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

  devise :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else
        user = User.create(
          nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token[0, 20],
        )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      end
    end
    return user
  end

end
