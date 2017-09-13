class App < Sinatra::Base
  get '/profile' do
    env['warden'].authenticate!

    @user = AuthenticationService::CurrentUser.call(env)

    slim :profile
  end
end