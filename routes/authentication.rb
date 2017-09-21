class App < Sinatra::Base
  UNAUTHENTICATED_URL       = '/auth/unauthenticated'.freeze
  EMAIL_UNAVAILABLE_NOTICE  = 'This email is registered.'.freeze
  INVALID_PARAMETERS_NOTICE = 'Please, fill form properly.'.freeze
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
    
    case result
    when :email_unavailable
      flash[:notice] = EMAIL_UNAVAILABLE_NOTICE
      redirect '/auth/signup'
    when :invalid_parameters
      flash[:notice] = INVALID_PARAMETERS_NOTICE
      redirect '/auth/signup'
    else
      redirect '/'
    end
  end

  post UNAUTHENTICATED_URL do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].blank?

    flash[:notice] = env['warden.options'][:message]

    redirect '/auth/login'
  end
end
