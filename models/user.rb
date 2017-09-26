class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { in: 8..16 }
  validates :email,    uniqueness: true

  has_many :orders
end