FactoryBot.define do
  factory :purchase_shipping do
    token {"tok_abcdefghijk00000000000000000"}
    post_number     {'000-1234'}
    prefecture_id   {Faker::Number.within(range: 2..48)}
    city            {'東京都'}
    address         {'3-4-5'}
    house_number    {'東京レジデンス'}
    tel             {'09012345678'}
  end
end
