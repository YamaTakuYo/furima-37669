class Item < ApplicationRecord

  with_options presence: true do
    validates :user
    validates :name
    validates :price
    validates :description
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :delivery_cost_id
    validates :delivery_date_id

end
