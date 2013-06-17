class Product < ActiveRecord::Base
  attr_accessible :name, :price

  has_many :items

  validates :name,  presence: true
  validates :price, presence: true, numericality: true
end
