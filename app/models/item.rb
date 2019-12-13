class Item < ApplicationRecord

  validates :name,:status,:derivery_fee,:price,:derivery_estimated,:description,:image,:category_id,:prefecture_id, presence: true
  
  mount_uploader :image, ImageUploader

end
