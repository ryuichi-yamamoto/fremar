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
- has_many :addresses
- has_many :items
- has_many :comments

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hiragana|string|null: false|
|last_name_hiragana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|room|string||
|tel|string|unique: true|
### Association
- belongs_to :user

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|price|integer||
|text|text||
|size|string||
|prefecture|integer||
|status|string||
|deliveryfee|integer||
|deliveryday|integer||
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :brand
- belongs_to :category

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

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item