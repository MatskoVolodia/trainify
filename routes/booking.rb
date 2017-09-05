class App < Sinatra::Base
  get '/booking/:route_id' do
    @route = Route.find(params[:route_id])
    @department = City.find(@route.start_id)
    @arrival = City.find(@route.destination_id)
    @train = Train.find(@route.train_id)

    @config = Config.first

    booked_seats = OrdersHandler.get_booked_seats(params[:route_id])
    @first_class_available_seats = @train.first_class_seats_count - booked_seats[0]
    @second_class_available_seats = @train.second_class_seats_count - booked_seats[1]

    @first_class_price = @config.first_class_price * @route.price_coefficient
    @second_class_price = @config.second_class_price * @route.price_coefficient
    slim :booking
  end

  post '/booking' do
    OrdersHandler.create_order(params)
    redirect '/'
  end
end