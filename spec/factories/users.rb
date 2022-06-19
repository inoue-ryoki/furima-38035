FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { 'a111111' }
    password_confirmation { password }
    last_name { japanese_user.last.kanji }
    first_name { japanese_user.first.kanji }
    last_name_reading { japanese_user.last.katakana }
    first_name_reading { japanese_user.first.katakana }
    birthday { Faker::Date.backward }
  end
end
