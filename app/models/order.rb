class Order < ActiveRecord::Base
  attr_accessible :user_id, :items_attributes

  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  validates :user_id, presence: true
end
