# 1on1 Meeting Support
1on1meeting専用のビジネスチャットアプリです。  
シンプルで使いやすい設計にしております。
![image](https://user-images.githubusercontent.com/70362048/113370645-592aea80-939f-11eb-921b-ea8132ef7289.png)


### デプロイURL
https://meeting-app2.herokuapp.com/  

### テスト用アカウント
Email: test@test.com  
Password: test1234  

### 利用方法の流れ
2.テスト用アカウントでログイン  
3.ミーティングルーム作成  
4.ミーティングルーム入室 

### このアプリで開発したきっかけ
自身の経験で、1on1ミーティングを行なった事がありました。
当時は記録・進捗を手書きメモで行なっていんたのですが、手書きに対して不便さを感じており、専用のアプリがあれば嬉しいと感じていた事がきっかけです。
ビジネスチャットで使う、slack等のアプリは多機能の為、使いづらいと感じる方もいる可能性があると感じたことです。

# 実装機能
・ユーザー登録、ログイン機能（devise）
[![Image from Gyazo](https://i.gyazo.com/eec7c0a4422c3f92031492a5dfb21009.jpg)](https://gyazo.com/eec7c0a4422c3f92031492a5dfb21009)
[![Image from Gyazo](https://i.gyazo.com/5ad1f0a446329589dd439e943d5f65a7.jpg)](https://gyazo.com/5ad1f0a446329589dd439e943d5f65a7)


# 今後実装予定の機能
・ゲストユーザーログイン機能  
・ミーティングルーム作成機能、削除機能  
・コメント投稿機能・削除機能  
・画像投稿機能  

# DB設計
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
