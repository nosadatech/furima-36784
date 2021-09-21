# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| lastname           | string | null: false                |
| firstname          | string | null: false                |
| lastname_kana      | string | null: false                |
| firstname_kana     | string | null: false                |
| birthday           | date   | null: false                |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| description           | text       | null: false                    |
| category_id           | int        | null: false                    |
| condition_id          | int        | null: false                    |
| delivery_charge_id    | int        | null: false                    |
| prefecture_id         | int        | null: false                    |
| delivery_day_id       | int        | null: false                    |
| price                 | int        | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order
### Association (Active Hash)
- has_many :categories
- has_many :conditions
- has_many :delivery_charges
- has_many :prefectures
- has_many :delivery_days

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery

## deliveries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture_id      | int        | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to:order
### Association (Active Hash)
- has_many :prefectures


# Active Hash

## category
### Association
- belongs_to :item

## condition
### Association
- belongs_to :item

## delivery_charge
### Association
- belongs_to :item

## delivery_day
### Association
- belongs_to :item

## prefecture
### Association
- belongs_to :item
- belongs_to :delivery

