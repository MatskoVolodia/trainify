class BookingPolicy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  def initialize(params)
    @user_email   = params[:user_email]
    @first_class  = params[:first_class] || 0
    @second_class = params[:second_class] || 0
  end

  def params_valid?
    at_least_one_ticket? and valid_email?
  end

  private

  attr_reader :first_class, :second_class, :user_email

  def valid_email?
    user_email =~ VALID_EMAIL_REGEX
  end
  
  def at_least_one_ticket?
    first_class.to_i > 0 || second_class.to_i > 0
  end
end