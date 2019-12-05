# DB設計 


## usersテーブル 

|Column|Type|Options| 
|------|----|-------| 
|first_name|String|null: false| 
|last_name|String|null: false| 
|first_name_kana|String|null: false| 
|last_name_kana|String|null: false| 
|nickname|String|null: false| 
|email|String|null: false, unique: true| 
|image|String|null: false| 
|adress|String|null: false| 
|building|String|null: true| 
|phone_number|integer|null: false, unique: true| 
|password|String|null: false| 
|birthday|integer|null: false| 

### Association 
- has_many :items 
- has_many :comments 
- has_many :addresses


## commentsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|text|text| 
|user_id|integer|null: false, forein_key: true| 
|item_id|integer|null: false, forein_key: true| 

### Association 
- belongs_to :user 
- belongs_to :item 


## itemsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|user_id|integer|null: false, forein_key: true| 
|items_categories|references|null: false, foreign_key: true| 
|items_brands|references|null: false, foreign_key: true| 
|size|String|null: false| 
|status|integer|null: false| 
|derivery_fee_id|integer|null: false, forein_key: true| 
|derivery_method_id|integer|null: false, forein_key: true| 
|price|integer|null: false| 
|derivery_estimated_id|integer|null: false, forein_key: true| 
|description|text|null: false| 


### Association 
- has_many :images 
- has_many :comments 
- has_many :categories through: :items_categories 
- has_many :brands through: :items_brands 
- belongs_to :status 
- belongs_to :derivery_fee 
- belongs_to :derivery_estimated 
- belongs_to :derivery_method 


## items_categoriesテーブル 

|Column|Type|Options| 
|------|----|-------| 
|item_id|integer|null: false, forein_key: true| 
|category_id|integer|null: false, forein_key: true| 

### Association 
- belongs_to :item 
- belongs_to :category 


## items_brandsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|item_id|integer|null: false, forein_key: true| 
|brand_id|integer|null: false, forein_key: true| 

### Association 
- belongs_to :item 
- belongs_to :brand 


## imagesテーブル 

|Column|Type|Options| 
|------|----|-------| 
|item_id|reference|null: false, forein_key: true| 

### Association 
- belongs_to :item 


## creditsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|number|integer|null: false, unique: true| 
|effective_date|integer|null: false| 
|security_code|integer|null: false| 
|user_id|reference|null: false, forein_key: true| 

### Association 
- belongs_to :user 


## addressesテーブル 

|Column|Type|Options| 
|------|----|-------| 
|address|String|null: false| 
|building|String|null: false| 
|zip_code|integer|null: false| 
|user_id|reference|null: false, forein_key: true| 

### Association 
- belongs_to :user 