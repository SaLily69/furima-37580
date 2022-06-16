# README

## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birth_day           | date    | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column               | Type       | Options                         |
| -------------------- | -----------| --------------------------------|
| product_name         | string     | null: false                     |
| product_text         | text       | null: false                     |
| product_category_id  | integer    | null: false                     |
| product_condition_id | integer    | null: false                     |
| shipping_cost_id     | integer    | null: false                     |
| prefecture_id        | integer    | null: false                     |
| shipping_day_id      | integer    | null: false                     |
| price                | integer    | null: false                     |
| user                 | references | null: false ,foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| item     | references | null: false ,foreign_key: true  |
| user     | references | null: false ,foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |
| post_number   | string      | null: false                     |
| prefecture_id | integer     | null: false                     |
| city          | string      | null: false                     |
| address       | string      | null: false                     |
| house_number  | string      |                                 |
| tel           | string      | null: false                     |
| purchase      | references  | null: false ,foreign_key: true  |

### Association
- belongs_to :purchase
