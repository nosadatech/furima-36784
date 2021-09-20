# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastname_kana      | string | null: false |
| firstname          | string | null: false |
| firstname_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| image                 | string     | null: false                    |
| item_name             | string     | null: false                    |
| item_description      | string     | null: false                    |
| item_category_id      | int        | null: false                    |
| item_condition_id     | int        | null: false                    |
| delivery_charge_id    | int        | null: false                    |
| days_to_ship_id       | int        | null: false                    |
| price                 | int        | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order
## Association (Active Hash)
- has_many :item_categorys
- has_many :item_conditions
- has_many :delivery_charges
- has_many :days_to_ships

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery

## deliverys テーブル

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
## Association (Active Hash)
- has_many :deliverys


# Active Hash

## item_category (Active Hash)
### Association
- belongs_to :item

## item_condition (Active Hash)
### Association
- belongs_to :item

## delivery_charge (Active Hash)
### Association
- belongs_to :item

## days_to_ship (Active Hash)
### Association
- belongs_to :item

## prefecture (Active Hash)
### Association
- belongs_to :delivery

