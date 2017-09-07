class BookingService
  class Search < ApplicationService
    def initialize(params)
      @route_id = params[:route_id]
    end

    def call
      orders = Order.where(route: @route_id)

      first_class   = orders.map(&:first_class_seats_count).sum
      second_class  = orders.map(&:second_class_seats_count).sum

      [first_class, second_class]
    end
  end
end