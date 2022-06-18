FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {'sss000'}
    password_confirmation {password}
    last_name             {'橋本'}
    first_name            {'早百合'}
    last_name_kana        {'ハシモト'}
    first_name_kana       {'サユリ'}
    birth_day             {'1990-01-01'}
  end
end