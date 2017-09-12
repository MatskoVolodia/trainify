class AuthenticationService
  class Logout < ApplicationService
    def call
      env['warden'].raw_session.inspect
      env['warden'].logout
    end
  end
end