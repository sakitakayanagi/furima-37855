# README

# テーブル設計

## usersテーブル

| Column              | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| nickname            | string | null: false , unique: true |
| email               | string | null: false , unique: true |
| encrypted_password  | string | null: false , unique: true |
| last_name           | string | null: false                |
| first_name          | string | null: false                |
| last_name_kana      | string | null: false                |
| first_name_kana     | string | null: false                |
| birth_date_id       | date   | null: false                |

### Association
has_many :items
has_many :orders

## itemsテーブル

| Column                      | Type       | Options                   |
| --------------------------- | ---------- | ------------------------- |
| user_id                     | references | null: false , unique: true|
| item_image                  | string     | null: false               |
| item_name                   | string     | null: false               |
| item_explain                | text       | null: false               |
| item_category_id            | integer    | null: false               |
| item_sales_status_id        | integer    | null: false               |
| item_shipping_fee_status_id | integer    | null: false               |
| item_prefecture_id          | integer    | null: false               |
| item_scheduled_delivery_id  | integer    | null: false               |
| item_price                  | integer    | null: false               |

### Association
belongs_to :user
has_one :order

## ordersテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user_id            | references | null: false , foreign_key: true |
| item_id            | references | null: false , foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addressテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| order_id           | references | null: false , foreign_key: true |
| postal_code        | string     | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building           | string     |                                 |
| phone_number       | string     | null: false                     |

### Association
belongs_to :order