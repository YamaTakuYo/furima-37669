FactoryBot.define do
  factory :trade_buyer do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '高高区少々町' }
    address       { '1-1-1' }
    building      { '多々マンション202' }
    phone_number  { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end