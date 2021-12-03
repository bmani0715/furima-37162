FactoryBot.define do
  factory :item_order do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    #association :user        
    #association :item     
    postal_code    {'123-4567'}
    prefecture_id  {'2'}
    municipalities {'横浜市緑区'}
    block_number   {'青山1-1-1'}
    building_name  {'柳ビル103'}
    phone_number   {'09012345678'}
  end
end