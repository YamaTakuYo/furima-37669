class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_cost
  belongs_to :delivery_date
  has_one_attached :image

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
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :delivery_cost_id
    validates :delivery_date_id
  end


end
