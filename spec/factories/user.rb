FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 {Faker::Internet.free_email}
    password              {'a00000'}
    password_confirmation { password }
    family_name           {'阿部'}
    first_name            {'太郎'}
    family_name_kana      {'アベ'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-02-03'}
  end
end
