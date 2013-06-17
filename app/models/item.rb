class Item < ActiveRecord::Base
  attr_accessible :amount, :order_id, :price, :product_id

  belongs_to :product
  belongs_to :order

  validates :amount, presence: true, numericality: true
  validates :price,  presence: true, numericality: true
end
