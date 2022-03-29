class Buyer < ApplicationRecord
  belongs_to :prefecture
  
  has_one :trade
end
