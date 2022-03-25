FactoryBot.define do
  factory :item do
    name             { 'test' }
    price            { 300 }
    description      { 2 }
    category_id      { 2 }
    condition_id     { 2 }
    prefecture_id    { 2 }
    delivery_cost_id { 2 }
    delivery_date_id { 2 }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
