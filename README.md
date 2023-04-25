## usersテーブル

| Column           | Type  | Options                        |
| ------           | ------| ------------------------------ |
|nickname          |string | null: false                    |
|email             |string | null: false,unique: true       |
|encrypted_password|string | null: false                    |
|second_name       |string | null: false                    |
|first_name        |string | null: false                    |
|second_name_kana  |string | null: false                    |
|first_name_kana   |string | null: false                    |
|birth_day         |date   | null: false                    |

### association
has_many :items
has_many :records

## itemsテーブル

| Column              | Type     | Options                        |
| ------              | ------   | ------------------------------ |
|user                 |references|null: false,foreign_key: true   |
|item_name            |string    | null: false                    |
|concept              |text      | null: false                    |
|item_type_id         |integer   | null: false                    |
|item_condition_id    |integer   | null: false                    |
|cost_type_id         |integer   | null: false                    |
|sender_aria_id       |integer   | null: false                    |
|days_ship_id         |integer   | null: false                    |
|price                |integer   | null: false                    |
 
 ### association
 has_one :record
 belongs_to :users

## recordsテーブル
| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|user              |references| null: false,foreign_key: true  |
|item              |references| null: false,foreign_key: true  |

### association
belongs_to :users
belongs_to :items
has_one :shipping_address

## shipping_addressesテーブル
| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|post_code         |string    | null: false                    |
|sender_aria_id    |integer   | null:false                     |
|municipalities    |string    | null:false                     |
|address           |references| null:false,foreign_key: true   |
|building_name     |references| foreign_key: true              |
|telephone_number  |references| null:false,foreign_key: true   |

### association
belongs_to :record
