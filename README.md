# テーブル設計

## users テーブル

| Column                 | Type     | Options     |
| ------------------     | ------   | ----------- |
| nickname               | string   | null: false |
| email                  | string   | null: false |
| password_confirmation  | string   | null: false |
| last_name              | string   | null: false |
| first_name             | string   | null: false |
| last_name_reading      | string   | null: false |
| first_name_reading     | string   | null: false |
| birthday               | datetime | null: false |

has_many :items
has_many :buyers

## items テーブル

| Column            | Type      | Options     |
| ------------------| ------    | ----------- |
| name              | string    | null: false |
| text              | string    | null: false |
| category_id       | integer   | null: false |
| condition_id      | integer   | null: false |
| responsibility_id | integer   | null: false |
| area_id           | integer   | null: false |
| date_id           | integer   | null: false |
| price             | integer   | null: false |
| user_id           | references| null: false, foreign_key: true  |

belongs_to :user
has_one :buyer


## buyers テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column                 | Type       | Options     |
| ------------------     | ------     | ----------- |
| post_code              | integer    | null: false |
| address_id             | integer    | null: false |
| prefecture             | string     | null: false |
| city                   | string     | null: false |
| house_number           | string     | null: false |
| build_name             | string     |  
| telephone_number       | integer    | null: false |
| buyer_id               | references | null: false, foreign_key: true  |

belongs_to :buyer
