class BookingService
  class CreateOrder < ApplicationService
    delegate :params_valid?, to: :policy

    def initialize(params)
      @params = params
    end

    def call
      create_order if params_valid?
    end

    private

    attr_reader :params

    def policy
      @policy ||= BookingPolicy.new(params)
    end

    def create_order
      Order.create(
        user_email:               params[:user_email],
        route:                    params[:route_id],
        first_class_seats_count:  params[:first_class].to_i,
        second_class_seats_count: params[:second_class].to_i
      )
    end
  end
end
