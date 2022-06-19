FactoryBot.define do
  factory :order do
    post_code { '123-4567' }
    area_id { 2 }
    city { '徳島市' }
    house_number { '1-1' }
    build_name { '徳島ハイツ' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
