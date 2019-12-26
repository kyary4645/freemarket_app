
# DB設計 


## usersテーブル 

|Column|Type|Options| 
|------|----|-------| 
|nickname|string|null: false| 
|email|string|null: false, unique: true|  
|password|string|null: false| 

### Association 
- has_many :items 
- has_many :comments 
- has_one :prifiles
- has_many :sns_credentials

## itemsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|user_id|integer|null: false, foreign_key: true| 
|name|string|null: false| 
|size|string|null: false| 
|status|string|null: false| 
|derivery_fee|string|null: false| 
|derivery_method|string|null: false| 
|price|integer|null: false| 
|derivery_estimated|string|null: false| 
|description|text|null: false| 
|image|string|null: false| 
|category1|text|null: false| 
|category2|text|null: false| 
|category3|text|null: false| 
|brand|text|null: false|
|prefecture_id|string|null: false| 
|seller_id|integer| 


### Association 
- belongs_to :user

## profilesテーブル 

|Column|Type|Options| 
|------|----|-------| 
|first_name|string|null: false| 
|last_name|string|null: false| 
|first_name_kana|string|null: false| 
|last_name_kana|string|null: false| 
|image|string|
|birth_year|string|null: false| 
|birth_month|string|null: false| 
|birth_day|string|null: false| 
|prefecture|string|null: false| 
|city|string|null: false| 
|house_number|integer|null: false| 
|zip_code|integer|null: false| 
|building|string|null: true| 
|phone_number|string||
|user_id|reference|null: false, foreign_key: true| 

### Association 
- belongs_to :user  

## creditsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|user_id|references|null: false| 
|customer_id|string|null: false|  
|card_id|string|null: false| 

### Association 
- belongs_to :user

## sns_credentialsテーブル 

|Column|Type|Options| 
|------|----|-------| 
|user_id|references|null: false| 
|uid|string|null: false|  
|provider|string|null: false| 

### Association 
- belongs_to :user