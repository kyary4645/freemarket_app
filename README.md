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
|phone_number|integer|null: true, unique: true| 
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
|size|String|null: false| 
|status|integer|null: false| 
|derivery_fee|integer|null: false| 
|derivery_method|integer|null: false| 
|price|integer|null: false| 
|derivery_estimated|integer|null: false| 
|description|text|null: false| 
|category_id|integer|null: false, forein_key: true| 
|brand_id|text|null: false, forein_key: true|

### Association 
- has_many :images 
- has_many :comments 
- belongs_to :category
- belongs_to :brand


## categoriesテーブル 

|Column|Type|Options| 
|------|----|-------| 
|name|String|null: false| 

### Association 
- has_many :items


## brandsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|name|String|null: false| 

### Association 
- has_many :items


## imagesテーブル 

|Column|Type|Options| 
|------|----|-------| 
|item_id|reference|null: false, forein_key: true| 
|url|String|null: false| 

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
|prefecture|String|null: false| 
|city|String|null: false| 
|house_number|integer|null: false| 
|zip_code|integer|null: false| 
|building|String|null: true| 
|user_id|reference|null: false, forein_key: true| 

### Association 
- belongs_to :user  