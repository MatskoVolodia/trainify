class BookingPresenter
  TICKETS_COUNT_LIMIT = 5

  delegate :title,  to: :department,  prefix: true
  delegate :title,  to: :arrival,     prefix: true
  delegate :id,     to: :route,       prefix: true

  delegate :first_class_price,  to: :config
  delegate :second_class_price, to: :config
  delegate :price_coefficient,  to: :route

  def initialize(params)
    @params = params
  end

  def route
    @route ||= Route.find_by(id: params[:route_id])
  end

  def config
    @config ||= Config.first
  end
  
  def department
    @department ||= City.find_by(id: route&.start_id)
  end

  def arrival 
    @arrival ||= City.find_by(id: route&.destination_id)
  end

  def train
    @train ||= Train.find_by(id: route&.train_id)
  end

  def first_class_available_seats
    @first_class_available_seats ||= available_seats[:first_class]
  end

  def second_class_available_seats
    @second_class_available_seats ||= available_seats[:second_class]
  end

  def max_first_class_tickets_count
    [first_class_available_seats, TICKETS_COUNT_LIMIT].min
  end

  def max_second_class_tickets_count
    [second_class_available_seats, TICKETS_COUNT_LIMIT].min
  end

  def current_prices
    BookingService::CurrentPrices.call(
      first_class_price:  first_class_price,
      second_class_price: second_class_price,
      price_coefficient:  price_coefficient
    )
  end

  private

  attr_reader :params

  def available_seats
    @available_seats ||= BookingService::AvailableTickets.call(
      first_class_seats_count:  train.first_class_seats_count,
      second_class_seats_count: train.second_class_seats_count,
      booked_seats:             booked_seats
    )
  end

  def booked_seats
    @booked_seats ||= BookingService::Search.call(params)
  end
end