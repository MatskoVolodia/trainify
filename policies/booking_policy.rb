class BookingPolicy
  def initialize(params)
    @first_class  = params[:first_class].to_i
    @second_class = params[:second_class].to_i
  end

  def params_valid?
    at_least_one_ticket?
  end

  private

  attr_reader :first_class, :second_class

  def at_least_one_ticket?
    first_class.to_i > 0 || second_class.to_i > 0
  end
end
