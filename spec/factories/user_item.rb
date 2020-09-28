FactoryBot.define do
  factory :user_item do
    token          {4_242_424_242_424_242}
    post_code      { '123-4567' }
    prefecture_id  { 1 }
    city           { '大阪市' }
    address        { '城東区' }
    building_name  { 'ビル100' }
    phone_number   { 12_345_678_901 }
    user_id        {1}
    item_id        {1}
  end
end
