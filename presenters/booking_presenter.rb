class BookingPresenter
  TICKETS_COUNT_LIMIT = 5

  attr_reader :first_class_available_seats, :second_class_available_seats,
              :first_class_price, :second_class_price

  def initialize(params)
    @params     = params
    @route      = Route.find_by_id(@params[:route_id])
    @department = City.find_by_id(@route&.start_id)
    @arrival    = City.find_by_id(@route&.destination_id)
    @train      = Train.find_by_id(@route&.train_id)
    @config     = Config.first

    @first_class_available_seats, @second_class_available_seats = get_available_seats
    @first_class_price, @second_class_price                     = get_current_prices
  end

  def department_title
    @department.title
  end

  def arrival_title
    @arrival.title
  end

  def route_id
    @route.id
  end

  def max_first_class_tickets_count
    [ @first_class_available_seats, TICKETS_COUNT_LIMIT ].min
  end

  def max_second_class_tickets_count
    [ @second_class_available_seats, TICKETS_COUNT_LIMIT ].min
  end

  private

  def get_available_seats
    booked_seats = BookingService::Search.new(@params).call

    [ @train.first_class_seats_count - booked_seats[0],
      @train.second_class_seats_count - booked_seats[1] ]
  end

  def get_current_prices
    [ @config&.first_class_price * @route&.price_coefficient,
      @config&.second_class_price * @route&.price_coefficient ]
  end
end