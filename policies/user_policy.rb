class UserPolicy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def initialize(params)
    @params = params
  end

  def user_info_valid?
    valid_email? && valid_password?
  end

  private

  attr_reader :params

  def email
    @email ||= params[:email]
  end

  def password
    @password ||= params[:password]
  end

  def valid_email?
    email =~ VALID_EMAIL_REGEX
  end

  def valid_password?
    password.length.between?(8, 16)
  end
end