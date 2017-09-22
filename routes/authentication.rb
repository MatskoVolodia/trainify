class App < Sinatra::Base
  UNAUTHENTICATED_URL       = '/auth/unauthenticated'.freeze
  INVALID_LOGIN_INFO_NOTICE = 'Email or password is incorrect'.freeze

  get '/auth/login' do
    slim :login
  end

  post '/auth/login' do
    env['warden'].authenticate!

    redirect session.fetch(:return_to, '/')
  end

  get '/auth/logout' do
    AuthenticationService::Logout.call(env)

    redirect '/'
  end

  get '/auth/signup' do
    slim :signup
  end

  post '/auth/signup' do
    result = AuthenticationService::SignUp.call(params)
    continue_with = AuthenticationService::AfterSignUp.call(result)

    flash[:notice] = continue_with[:notice]
    redirect continue_with[:redirect_path]
  end

  post UNAUTHENTICATED_URL do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].blank?

    flash[:notice] = env['warden.options'][:message]

    redirect '/auth/login'
  end
end
