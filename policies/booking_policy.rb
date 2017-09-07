class BookingPolicy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def initialize(params)
    @user_email   = params[:user_email]
    @first_class  = params[:first_class] || 0
    @second_class = params[:second_class] || 0
  end

  def params_valid?
    (@first_class.to_i > 0 || @second_class.to_i > 0) && valid_email?
  end

  private

  def valid_email?
    !!(@user_email =~ VALID_EMAIL_REGEX)
  end
end