class AuthenticationService
  class CurrentUser < ApplicationService
    def initialize(env)
      @env = env
    end

    def call
      env['warden'].user
    end

    private

    attr_reader :env
  end
end
