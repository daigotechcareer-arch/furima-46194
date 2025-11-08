FactoryBot.define do
  factory :order_address do
    postal_code   { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_address }
    building      { Faker::Address.secondary_address }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
    token         { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }
  end
end