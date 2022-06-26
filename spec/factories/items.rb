FactoryBot.define do
  factory :item do
    image
    product_name
    product_text
    product_category_id
    product_condition_id
    shipping_cost_id
    prefecture_id
    shipping_day_id
    price
  end
end
