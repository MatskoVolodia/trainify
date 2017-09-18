class App < Sinatra::Base
  get '/booking/:route_id' do
    env['warden'].authenticate!

    @booking = BookingPresenter.new(params)

    slim :booking
  end

  post '/booking' do
    env['warden'].authenticate!

    BookingService::CreateOrder.call(params: params, env: env)

    redirect '/'
  end
end
