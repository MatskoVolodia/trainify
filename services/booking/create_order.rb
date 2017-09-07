class BookingService
  class CreateOrder < ApplicationService
    def initialize(params)
      @user_email   = params[:user_email]
      @route_id     = params[:route_id]
      @first_class  = params[:first_class]
      @second_class = params[:second_class]
    end

    def call
      Order.create(
        user_email:       @user_email,
        route:                    @route_id,
        first_class_seats_count:  @first_class,
        second_class_seats_count: @second_class
      )
    end
  end
end
