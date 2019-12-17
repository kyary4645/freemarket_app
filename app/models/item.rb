class Item < ApplicationRecord

  validates :status,:derivery_fee,:price,:derivery_estimated,:description,:image,:category,:prefecture_id, presence: true
  
  validates :name, presence: true, length: {maximum: 40}
  

  mount_uploader :image, ImageUploader
  belongs_to :user

end
