class App < Sinatra::Base
  get '/profile' do
    env['warden'].authenticate!

    slim :profile
  end
end