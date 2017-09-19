class App < Sinatra::Base
  UNAUTHENTICATED_URL = '/auth/unauthenticated'.freeze

  get '/auth/login' do
    slim :login
  end

  post '/auth/login' do
    env['warden'].authenticate!

    session.fetch(:return_to, '/')
  end

  get '/auth/logout' do
    AuthenticationService::Logout.call(env)

    redirect '/'
  end

  post UNAUTHENTICATED_URL do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    redirect '/auth/login'
  end
end