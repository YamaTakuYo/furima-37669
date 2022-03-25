# README

## Usersテーブル

|Column             |Type    |Options                 |
|-------------------|--------|------------------------|
|nickname           | string | null:false             |
|email              | string | null:false, unique:true|
|encrypted_password | string | null:false             |
|first_name         | string | null:false             |
|last_name          | string | null:false             |
|first_name_kana    | string | null:false             |
|last_name_kana     | string | null:false             |
|birthday           | date   | null:false             |

### Association

has_many:items
has_many:trades

## Itemsテーブル

|Column           |Type        |Options                       |
|-----------------|------------|------------------------------|
|user             | references | null:false, foreign_key:true |
|name             | string     | null:false                   |
|price            | integer    | null:false                   |
|description      | text       | null:false                   |
|category_id      | integer    | null:false                   |
|condition_id     | integer    | null:false                   |
|prefecture_id    | integer    | null:false                   |
|delivery_cost_id | integer    | null:false                   |
|delivery_date_id | integer    | null:false                   |

### Association

belongs_to :user
has_one :trade

## Buyersテーブル

|Column        |Type        |Options                       |
|--------------|------------|------------------------------|
|trade         | references | null:false, foreign_key:true |
|postal_code   | string     | null:false                   |
|prefecture_id | integer    | null:false                   |
|city          | string     | null:false                   |
|address       | string     | null:false                   |
|building      | string     |                              |
|phone_number  | string     | null:false                   |

### Association

belongs_to :trade

## Tradesテーブル

|Column |Type        |Options                       |
|-------|------------|------------------------------|
|user   | references | null:false, foreign_key:true |
|item   | references | null:false, foreign_key:true |

### Association

belongs_to :user
belongs_to :item
has_one :buyer