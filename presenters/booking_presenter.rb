class BookingPresenter
  TICKETS_COUNT_LIMIT = 5

  delegate :title,  to: :department,  prefix: true
  delegate :title,  to: :arrival,     prefix: true
  delegate :id,     to: :route,       prefix: true

  def initialize(params)
    @params = params
  end

  def department
    @department ||= City.find_by(id: route&.start_id)
  end

  def route
    @route ||= Route.find_by(id: @params[:route_id])
  end

  def arrival 
    @arrival ||= City.find_by(id: @route&.destination_id)
  end

  def train
    @train ||= Train.find_by(id: @route&.train_id)
  end

  def config
    @config ||= Config.first
  end

  def first_class_available_seats
    @first_class_available_seats ||= get_available_seats[:first_class]
  end

  def second_class_available_seats
    @second_class_available_seats ||= get_available_seats[:second_class]
  end

  def max_first_class_tickets_count
    [first_class_available_seats, TICKETS_COUNT_LIMIT].min
  end

  def max_second_class_tickets_count
    [second_class_available_seats, TICKETS_COUNT_LIMIT].min
  end

  def first_class_price
    @first_class_price ||= config.first_class_price
  end

  def second_class_price
    @second_class_price ||= config.second_class_price
  end

  private

  def get_available_seats
    booked_seats = BookingService::Search.call(@params)

    {
      first_class:  train.first_class_seats_count - booked_seats[:first_class],
      second_class: train.second_class_seats_count - booked_seats[:second_class]
    }
  end

  def get_current_prices
    {
      first_class:    config&.first_class_price * route&.price_coefficient,
      second_class:   config&.second_class_price * route&.price_coefficient
    }
  end
end