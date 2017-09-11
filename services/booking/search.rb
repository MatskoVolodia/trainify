class BookingService
  class Search < ApplicationService
    def initialize(params)
      @route_id = params[:route_id]
    end

    def call
      booked_seats
    end

    def orders
      @orders ||= Order.where(route: route_id)
    end

    private

    attr_reader :route_id

    def booked_seats
      {
        first_class:  orders.map(&:first_class_seats_count).sum,
        second_class: orders.map(&:second_class_seats_count).sum
      }
    end
  end
end
