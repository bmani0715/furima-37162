FactoryBot.define do
  factory :item do
    association :user

    product_name               {Faker::Name.name}
    description                {Faker::Lorem.sentence}
    category_id                {2}
    product_condition_id       {2}
    delivery_fee_id            {2}
    prefecture_id              {2}
    days_to_ship_id            {2}
    price                      {1000}  
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end