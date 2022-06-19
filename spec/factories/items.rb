FactoryBot.define do
  factory :item do
    name { '商品' }
    text { 'これは商品です' }
    category_id { 2 }
    condition_id { 2 }
    responsibility_id { 2 }
    area_id { 2 }
    period_id { 2 }
    price { '1000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
