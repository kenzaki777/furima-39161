class RecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:post_code, :sender_area_id, :municipalities, :address, :building_name, :telephone_number,:token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :sender_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true, length: { minimum: 10, maximum: 11 }
  validates :telephone_number, format: {with: /^0[0-9]{9,10}$/u  , message: "is not a valid number" }
  validates :token, presence: true

  def save
  
    record = Record.create(user_id: user_id,item_id: item_id)
  
    ShippingAddress.create(post_code: post_code, sender_area_id: sender_area_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, record_id: record.id)
  end

end