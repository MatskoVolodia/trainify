class App < Sinatra::Base
  get '/booking/:route_id' do
    env['warden'].authenticate!

    @booking = BookingPresenter.new(params)

    slim :booking
  end

  post '/booking' do
    BookingService::CreateOrder.call(params)

    redirect '/'
  end
end
