# README

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :records



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | text       | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :record



## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| credit_card     | string     | null: false                    |
| postal_code     | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| record          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :record



## records テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
