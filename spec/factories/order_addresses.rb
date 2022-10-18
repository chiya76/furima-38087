FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    address { Faker::Address.zip }
    building_name { Faker::Lorem.word }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end
