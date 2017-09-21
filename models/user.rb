class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { in: 8..16 }
  has_many :orders
end