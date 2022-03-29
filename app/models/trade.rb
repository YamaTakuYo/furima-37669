class Trade < ApplicationRecord
  belongs_to :prefecture

  belongs_to :buyer
end
