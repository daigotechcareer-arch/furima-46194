# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    name                  { Faker::Commerce.product_name }
    description           { Faker::Lorem.sentence }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_charge_id    { 2 }
    prefecture_id         { 2 }
    days_to_ship_id       { 2 }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open('public/images/test_image.png'),
        filename: 'test_image.png'
      )
    end
  end
end
