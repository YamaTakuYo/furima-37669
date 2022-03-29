class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :buyer
end
