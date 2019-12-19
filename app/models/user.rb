class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: %i[facebook google_oauth2]

  has_many :credits
  has_one :profile, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_many :items

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: {minimum: 7}
  validates :nickname, presence: true, length: {maximum: 30}


  def self.without_sns_data(auth)
    user = User.find_by(email: auth.info.email)

    if user.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(8)
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider,
      )
    end
    return { user: user, sns: sns}
  end

  def self.with_sns_data(auth, snscredential)

    user = User.find_by(id: snscredential.user_id)

    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(8)
      )
    end

    return { user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user, sns: sns }
  end

end