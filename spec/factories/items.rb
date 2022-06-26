FactoryBot.define do
  factory :item do
    product_name          {Faker::Name.initials(number: 6)}
    product_text          {Faker::Lorem.sentence}
    product_category_id   {Faker::Number.within(range: 2..11)}
    product_condition_id  {Faker::Number.within(range: 2..7)}
    shipping_cost_id      {Faker::Number.within(range: 2..3)}
    prefecture_id         {Faker::Number.within(range: 2..48)}
    shipping_day_id       {Faker::Number.within(range: 2..4)}
    price                 {Faker::Number.within(range: 300..9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    association :user

  end
end
