class App < Sinatra::Base
  def current_user
    env['warden'].user
  end
end
