usersテーブル

| Column           | Type  | Options                        |
| ------           | ------| ------------------------------ |
|nickname          |string | null: false                    |
|mail address      |string | null: false                    |
|encrypted_password|string | null: false                    |

association
has_many :items
has_many :records

itemsテーブル

| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|user              |references|null: false,foreign_key: true   |
|item_name         |string    | null: false                    |
|concept           |text      | null: false                    |
|item_type         |string    | null: false                    |
|item_condition    |string    | null: false                    |
|cost_type         |string    | null: false                    |
|sender_aria       |string    | null: false                    |
|days_ship         |string    | null: false                    |
|praice            |integer   | null: false                    |
 
 association
 has_one :records
 has_one :users

recordsテーブル
| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|user              |references| null: false,foreign_key: true  |
|item              |references| null: false,foreign_key: true  |

association
has_one :users
has_one :items
has_one :shipping_address

shipping_addressテーブル
| Column           | Type     | Options                        |
| ------           | ------   | ------------------------------ |
|post_code         |string    | null: false                    |
|prefectures       |string    | null:false                     |
|municipalities    |string    | null:false                     |
|address           |string    | null:false                     |
|Building name     |string    |                                |
|telephone number  |integer   | null:false                     |

association
has_one :records
