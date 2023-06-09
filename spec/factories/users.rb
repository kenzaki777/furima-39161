FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    transient do
      person { Gimei.name }
    end
    second_name { person.first.kanji }
    first_name { person.last.kanji }
    second_name_kana { person.first.katakana }
    first_name_kana { person.last.katakana }
    birth_day       { Faker::Date.backward }
    end
    end
  

