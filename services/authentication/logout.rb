class AuthenticationService
  class Logout < ApplicationService
    def initialize(env)
      @env = env
    end

    def call
      env['warden'].raw_session.inspect
      env['warden'].logout
    end

    private

    attr_reader :env
  end
end