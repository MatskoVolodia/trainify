class App < Sinatra::Base
  get '/booking/:route_id' do
    @booking = BookingPresenter.new(params)

    slim :booking
  end

  post '/booking' do
    BookingService::CreateOrder.call(params)
    redirect '/'
  end
end
