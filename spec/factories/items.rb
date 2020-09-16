FactoryBot.define do
  factory :item do
     name            {"ああ"}
     explanation      {"楽しい"}   
     category_id      {1}
     condition_id     {1}
     postage_id      {1}
     area_id        {1}
     delivery_time_id {1} 
     price            {1000}

     association :user

  end
end
