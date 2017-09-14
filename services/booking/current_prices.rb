class BookingService
  class CurrentPrices < ApplicationService
    def initialize(params)
      @first_class_price  = params[:first_class_price].to_f
      @second_class_price = params[:second_class_price].to_f
      @price_coefficient  = params[:price_coefficient].to_f
    end

    def call
      {
        first_class:  current_price(first_class_price),
        second_class: current_price(second_class_price)
      }
    end

    private

    attr_reader :first_class_price, :second_class_price, :price_coefficient

    def current_price(price)
      price * price_coefficient
    end
  end
end
