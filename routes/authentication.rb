class App < Sinatra::Base
  UNAUTHENTICATED_URL       = '/auth/unauthenticated'.freeze
  INVALID_LOGIN_INFO_NOTICE = 'Email or password is incorrect'.freeze
  SUCCESSFUL_SIGN_UP_NOTICE = 'You successfully signed up'.freeze

  %w[/auth/login /auth/signup].each do |path|
    before path do
      redirect '/' if current_user
    end
  end

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
    user = AuthenticationService::SignUp.call(params)

    if user.invalid?
      flash.now[:alert] = user.errors.full_messages.join(', ')
      slim :signup
    else
      redirect '/', notice: SUCCESSFUL_SIGN_UP_NOTICE
    end
  end

  post UNAUTHENTICATED_URL do
    session[:return_to] ||= env['warden.options'][:attempted_path]

    redirect '/auth/login', notice: env['warden.options'][:message]
  end
end
