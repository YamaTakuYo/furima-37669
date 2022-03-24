FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { '000aaa' }
    last_name             { 'ふみま' }
    first_name            { '太郎' }
    last_name_kana        { 'フミマ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2222/2/22' }
  end
end
