# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# fremar DB設計
## usersテーブル  
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hiragana|string|null: false|
|last_name_hiragana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|password|string|null: false|
|mail|string|null: false, unique: true|
|status|string|null: false|
|deleted_at|datetime|null: false|
### Association
- belongs_to :addresses
- has_many   :items
- has_many   :comments
- has_many   :cards

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hiragana|string|null: false|
|last_name_hiragana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|room|string||
|tel|string|unique: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|price|integer||
|text|text||
|size|string||
|prefecture|integer|null: false, foreign_key: true|
|blandName|string||
|status|integer|null: false, foreign_key: true|
|deliveryfee|integer|null: false, foreign_key: true|
|deliveryday|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :status
- belongs_to_active_hash :deliveryfee
- belongs_to_active_hash :deliveryday

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|||
### Association
- has_many :items
- has_ancestry

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
