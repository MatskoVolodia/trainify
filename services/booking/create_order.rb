class BookingService
  class CreateOrder < ApplicationService
    delegate :params_valid?, to: :policy
    
    def initialize(params)
      @params = params
    end

    def call
      if params_valid?
        Order.create(
          user_email:               @params[:user_email],
          route:                    @params[:route_id],
          first_class_seats_count:  @params[:first_class] || 0,
          second_class_seats_count: @params[:second_class] || 0
        )
      end
    end

    def policy
      @policy ||= BookingPolicy.new(@params)
    end
  end
end
