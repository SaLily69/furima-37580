FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'橋本'}
    first_name            {'早百合'}
    last_name_kana        {'ハシモト'}
    first_name_kana       {'サユリ'}
    birth_day             {'19900101'}
  end
end