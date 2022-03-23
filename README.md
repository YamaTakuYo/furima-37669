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
has_many:tredes

## Itemsテーブル

|Column           |Type        |Options                       |
|-----------------|------------|------------------------------|
|user             | references | null:false, foreign_key:true |
|name             | string     | null:false                   |
|price            | integer    | null:false                   |
|description_id   | text       | null:false                   |
|category_id      | integer    | null:false                   |
|prefectures_id   | integer    | null:false                   |
|delivery_cost_id | integer    | null:false                   |
|derivery_dete_id | integer    | null:false                   |

### Association

belongs_to :user
has_one :tredes

## Buyersテーブル

|Column        |Type        |Options                       |
|--------------|------------|------------------------------|
|buyer         | references | null:false, foreign_key:true |
|postal_code   | string     | null:false                   |
|prefecture_id | integer    | null:false                   |
|city_id       | string     | null:false                   |
|address_id    | string     | null:false                   |
|building_id   | string     |                              |
|phone_naumber | string     | null:false                   |

### Association

belongs_to :tredes

## Tredesテーブル

|Column |Type        |Options                       |
|-------|------------|------------------------------|
|user   | references | null:false, foreign_key:true |
|item   | references | null:false, foreign_key:true |

### Association

belongs_to :user
belongs_to :item
has_one :buyer