class App < Sinatra::Base
  delegate  :department_title, :arrival_title, :route_id,
            :first_class_available_seats, :second_class_available_seats,
            :first_class_price, :second_class_price,
            :max_first_class_tickets_count, :max_second_class_tickets_count,
            to: :@booking

  get '/booking/:route_id' do
    @booking = BookingPresenter.new(params)

    slim :booking
  end

  post '/booking' do
    BookingService::CreateOrder.new(params).call
    redirect '/'
  end
end