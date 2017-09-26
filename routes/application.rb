class App < Sinatra::Base
  def current_user
    @current_user ||= env['warden'].user
  end
end
