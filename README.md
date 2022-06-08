# テーブル設計

## users テーブル

| Column                 | Type     | Options                 |
| ------------------     | ------   | -----------             |
| nickname               | string   | null: false             |
| email                  | string   | null: false, unique:true|
| encrypted_password     | string   | null: false             |
| last_name              | string   | null: false             |
| first_name             | string   | null: false             |
| last_name_reading      | string   | null: false             |
| first_name_reading     | string   | null: false             |
| birthday               | date     | null: false             |

has_many :items
has_many :buyers

## items テーブル

| Column            | Type      | Options     |
| ------------------| ------    | ----------- |
| name              | string    | null: false |
| text              | text      | null: false |
| category_id       | integer   | null: false |
| condition_id      | integer   | null: false |
| responsibility_id | integer   | null: false |
| area_id           | integer   | null: false |
| period_id         | integer   | null: false |
| price             | integer   | null: false |
| user              | references| null: false, foreign_key: true  |

belongs_to :user
has_one :buyer


## buyers テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column                 | Type       | Options     |
| ------------------     | ------     | ----------- |
| post_code              | string     | null: false |
| area_id                | integer    | null: false |
| city                   | string     | null: false |
| house_number           | string     | null: false |
| build_name             | string     |  
| telephone_number       | string     | null: false |
| buyer                  | references | null: false, foreign_key: true  |

belongs_to :buyer
