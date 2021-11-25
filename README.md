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

## usersテーブル

| Column                   | Type   | Options                   |
| ------------------       | ------ | -----------               |
| nickname                 | string | null: false               |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false, unique: true |
| last_name                | string | null: false               |
| first_name               | string | null: false               |
| last_name_kana           | string | null: false               |
| first_name_kana          | string | null: false               |
| birthday                 | date   | null: false               |

### Association
has_many:items
has_many:orders

##　itemsテーブル

| Column                | Type       | Options                        |
| ------------------    | ------     | -----------                    |
| seller                | reference  | null: false,foreign_key: true  |
| product_name          | string     | null: false                    |
| description           | text       | null: false                    |
| category              | string     | null: false                    |
| product_condition     | string     | null: false                    |
| delivery_fee          | string     | null: false                    |
| shipping_area         | string     | null: false                    |
| days_to_ship          | string     | null: false                    |
| price                 | integer    | null: false                    |
| sales_commission      | integer    | null: false                    |
| sales_profit          | integer    | null: false                    |
| user_id               | integer    | null: false                    |

### Association
belongs_to:users
has_one:orders

##　ordersテーブル

| Column                | Type       | Options                        |
| ------------------    | ------     | -----------                    |
| user                  | references | null: false,foreign_key: true  |
| item                  | references | null: false,foreign_key: true  |
| user_id               | references | null: false                    |
| item_id               | references | null: false                    |

### Association
belongs_to:users
belongs_to:items
has_one:addresses

##　addressesテーブル

| Column                | Type       | Options                        |
| ------------------    | ------     | -----------                    |
| postal_code           | string     | null: false                    |
| prefecture            | string     | null: false                    |
| municipalities        | string     | null: false                    |
| block_number          | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |

### Association
belongs_to:orders