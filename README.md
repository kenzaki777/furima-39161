## usersテーブル

| Column           | Type  | Options                        |
| ------           | ------| ------------------------------ |
|nickname          |string | null: false                    |
|mail_address      |string | null: false,unique: true       |
|encrypted_password|string | null: false                    |
|real_name         |string | null: false                    |
|real_name_kana    |string | null: false                    |
|birth_day         |integer| null: false                    |

### association
has_many :items
has_many :records

## itemsテーブル

| Column              | Type     | Options                        |
| ------              | ------   | ------------------------------ |
|user                 |references|null: false,foreign_key: true   |
|item_name            |string    | null: false                    |
|concept              |text      | null: false                    |
|item_type**_id**     |integer   | null: false                    |
|item_condition**_id**|integer   | null: false                    |
|cost_type**_id**     |integer   | null: false                    |
|sender_aria**_id**   |integer   | null: false                    |
|days_ship**_id**     |integer   | null: false                    |
|price                |integer   | null: false                    |
 
 ### association
 has_one :records
 belongs_to :users

## recordsテーブル
| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|user              |references| null: false,foreign_key: true  |
|item              |references| null: false,foreign_key: true  |

### association
has_one :users
has_one :items
has_one :shipping_address

## shipping_addressテーブル
| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|post_code         |string    | null: false                    |
|sender_aria**_id**|integer   | null:false                     |
|municipalities    |string    | null:false                     |
|address           |string    | null:false                     |
|building_name     |string    |                                |
|telephone_number  |string    | null:false                     |

### association
belongs_to :records
