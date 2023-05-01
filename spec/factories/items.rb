FactoryBot.define do
  factory :item do
    item_name               {'遊戯王'}
    concept        {'ブラックマジシャンデッキです'}
    price              {'15000'}
    association :user
    item_type_id        {'7'}
    item_condition_id   {'2'}
    sender_area_id      {'2'}
    days_ship_id        {'2'}
    cost_type_id        {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/test.jpg'), filename: 'test.jpg')
    end
  end
end
  

