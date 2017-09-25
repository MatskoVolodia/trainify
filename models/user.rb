class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password

  validates_length_of :password, in: 8..16
  validates_format_of :email,    with: VALID_EMAIL_REGEX
  validates :email,              uniqueness: true
end