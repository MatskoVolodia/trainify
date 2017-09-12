class BookingService
  class AvailableTickets < ApplicationService
    def initialize(params)
      @first_class_seats_count  = params[:first_class_seats_count]
      @second_class_seats_count = params[:second_class_seats_count]
      @booked_seats             = params[:booked_seats]
    end

    def call
      {
        first_class:  first_class_available_seats,
        second_class: second_class_available_seats
      }
    end

    private

    attr_reader :first_class_seats_count,
                :second_class_seats_count,
                :booked_seats

    def first_class_available_seats
      first_class_seats_count - booked_seats[:first_class]
    end

    def second_class_available_seats
      second_class_seats_count - booked_seats[:second_class]
    end
  end
end
