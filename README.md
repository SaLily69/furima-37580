# README

## usersテーブル

| Column            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| nickname          | string  | null: false, unique: true |
| email             | string  | null: false, unique: true |
| password          | string  | null: false               |
| last_name         | string  | null: false               |
| first_name        | string  | null: false               |
| last_name_kana    | string  | null: false               |
| first_name_kana   | string  | null: false               |
| birth_year        | integer | null: false               |
| birth_month       | integer | null: false               |
| birth_day         | integer | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type       | Options                         |
| -------------------| -----------| --------------------------------|
| product_name       | string     | null: false                     |
| product_text       | text       | null: false                     |
| product_category   | string     | null: false                     |
| product_condition  | string     | null: false                     |
| shipping_cost      | string     | null: false                     |
| ship_from          | string     | null: false                     |
| shippind_days      | integer    | null: false                     |
| price              | integer    | null: false                     |
| seller_id          | references | null: false ,foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| item_id  | references | null: false ,foreign_key: true  |
| buyer_id | references | null: false ,foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル

| Column       | Type        | Options                         |
| ------------ | ----------- | ------------------------------- |
| post_number  | integer     | null: false                     |
| prefecture   | string      | null: false                     |
| city         | string      | null: false                     |
| address      | text        | null: false                     |
| building     | text        | null: false                     |
| tel          | integer     | null: false                     |
| purchase_id  | references  | null: false ,foreign_key: true  |

### Association
- belongs_to :purchase
