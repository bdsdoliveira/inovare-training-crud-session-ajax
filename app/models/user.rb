class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  belongs_to :order

  has_secure_password

  before_save do |user|
    user.email = email.downcase
    user.create_remember_token
  end

  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
