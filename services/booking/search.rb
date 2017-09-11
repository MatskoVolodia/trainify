class BookingService
  class Search < ApplicationService
    def initialize(params)
      @route_id = params[:route_id]
    end

    def call
      {
        first_class:  orders.map(&:first_class_seats_count).sum,
        second_class: orders.map(&:second_class_seats_count).sum
      }
    end

    private

    attr_reader :route_id

    def orders
      @orders ||= Order.where(route: route_id)
    end
  end
end
