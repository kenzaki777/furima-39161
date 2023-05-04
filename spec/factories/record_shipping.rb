FactoryBot.define do
  factory :record_shipping_address do
    post_code { '111-4567' }
    sender_area_id { '2' }
    municipalities { '宮崎市青山町' }
    address { '1丁目10番地' }
    building_name { '神マンション150F' }
    telephone_number { '08012345678' }
    token {"tok_abgfefghijk0000672000045300"}
  

  end
end