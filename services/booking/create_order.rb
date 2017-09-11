class BookingService
  class CreateOrder < ApplicationService
    delegate :params_valid?, to: :policy

    def initialize(params)
      @params = params
    end

    def call
      create_order if params_valid?
    end

    def policy
      @policy ||= BookingPolicy.new(params)
    end

    def create_order
      Order.create(
        user_email:                 params[:user_email],
        route:                      params[:route_id],
        first_class_seats_count:    valid_count(params[:first_class]),
        second_class_seats_count:   valid_count(params[:second_class])
      )
    end

    private

    attr_reader :params

    def valid_count(count)
      count.blank? ? 0 : count
    end
  end
end
