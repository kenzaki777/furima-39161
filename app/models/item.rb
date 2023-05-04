class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_type
  belongs_to :user
  belongs_to :item_condition
  belongs_to :cost_type
  belongs_to :sender_area
  belongs_to :days_ship
  has_one :record







  validates :item_type_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_type_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_area_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: { message: "can't be blank" }, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,only_integer: true, message: "is not a valid price" }
  validates :item_name, presence: true 
  validates :concept, presence: true
  validates :image, presence: true
end
