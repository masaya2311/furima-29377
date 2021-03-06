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
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false, uniqueness: true|
| password | string | null: false |
| family_name | string |　null: false |
| first_name | string |　null: false |
| family_name_kana | string |　null: false |
| first_name_kana | string |　null: false |
| birthday |　date |　null: false |

### Association
- has_many :items
- has_many :purchasers
 
## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| explanation | text | null: false |
| category_id |　integer | null: false |
| condition_id |　integer | null: false |
| postage_id | integer | null: false |
| area_id | integer | null: false |
| delivery_time_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchaser
- has_one_attached :image

## purchasers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| address | string | null: false |
| building_name | string | ||
| phone_number | string | null: false, uniqueness: true |
| purchaser | references | null: false, foreign_key: true |

### Association
- belongs_to :purchaser
