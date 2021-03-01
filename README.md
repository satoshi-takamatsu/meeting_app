# README

# テーブル設計

## users テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| email              | string      | null: false                    |
| encrypted_password | string      | null: false                    |

### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :comments


## rooms_users テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| room               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room


## comments テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| room               | references  | null: false, foreign_key: true |
| content            | text        | null: false                    |
<!-- imageはAWSで導入 -->

### Association
- belongs_to :user
- belongs_to :room


## rooms テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| room_name          | string      | null: false                    |
| room_url           | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
- has_many :room_users, dependent :destroy
- has_many :users, through :room_users
- has_many :comments, dependent :destroy