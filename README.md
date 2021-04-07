# テーブル設計


# アプリケーション概要
​
- 飲食店と農家をつなげるアプリ
- 飲食店は少量・多品種の農産物を小ロットで購入できる
- 農家は形状不良等で市場に卸せない野菜を飲食店に安価で販売することができる。
- 新規に飲食店を始めようとする場合に少量・多品種なので在庫を抱える心配が少ない
- 請求書・納品書も自動作成
- 曜日ごとに定められたルート配送を行うため、送料も毎月定額もしくは一回あたりで行う


## farmers テーブル  devise使用

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| company_name | string     | null: false | 会社名
| email        | string     | null: false |
| password     | string     | null: false |
| yagou        | string     |             | 
| describe     | string     |             | 説明





### Association

- has_many :stocks
- has_one :farmer_address




## farmer_addresses テーブル   農家の住所
​
| Column             | Type            | Options          |
|--------------------|-----------------| -----------------|
| postal_code        | string          | null: false      | 郵便番号
| prefecture_id      | integer         | null: false      | 都道府県名
| municipality       | string          | null: false      | 市
| address            | string          | null: false      | 番地
| building           | string          |                  | 建物
| tel_fam            | string          | null: false      | Fam_tEL
| farmer             | references      | foreign key:true | 

- belongs_to :farmer




## stocks テーブル

| Column             | Type       | Options                           |
| -----------------  | ---------  | --------------------------------- |
| crops_name         | string     | null: false                       | 農作物の名前
| set                | integer    | null: false                       | 何セットあるか
| explanation        | string     | null: false                       | 農作物の説明
| price              | integer    | null: false                       |
| farmer             | references | null: false, foreign_key: true    |
| category_id        | integer    | null: false, foreign_key: true    | 農作物の状態
| delivery_fee_id    | integer    | null: false                       | 送料
| delivery_day_id    | integer    | null: false                       | 




### Association

- belongs_to :farmer
- has_many :stock_customers
- has_many :customers, through: stock_customers



## customers テーブル

| Column             | Type       | Options     |
| -----------------  | ---------- | ------------|
| rep_name           | string     | null: false | 代表者名
| company_name       | string     | null: false | 株式会社
| email              | string     | null: false |
| password           | string     | null: false |
| yagou              | string     | null: false | 店名


### Association

- has_one :customer_address
- has_many :stock_customers
- has_many :stocks, through: stock_customers




## customer_addresses テーブル   飲食店の住所
​
| Column             | Type            | Options          |
| ------------------ | --------------- | ---------------- |
| postal_code        | string          | null: false      | 郵便番号
| prefecture_id      | integer         | null: false      | 都道府県名
| municipality       | string          | null: false      | 市
| address            | string          | null: false      | 番地
| building           | string          |                  | 建物
| tel_cus            | string          | null: false      | TEL
| customer           | references      | foreign key:true | 

- belongs_to :customer


## stock_customers テーブル  購入テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| stock     | references | null: false, foreign_key: true |
| customer  | references | null: false, foreign_key: true |
| buy-set   | integer    | null: false                    |





### Association

- belongs_to :stock
- belongs_to :customer