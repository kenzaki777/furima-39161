class ShippingAddress < ApplicationRecord

  belongs_to :record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sender_area
end
