class AuthenticationService
  class InitAuthentication < ApplicationService
    def call
      init_before_failure
      create_strategy
    end

    private

    def init_before_failure
      Warden::Manager.before_failure do |env, opts|
        env['REQUEST_METHOD'] = 'POST'
        env.each do |key, value|
          env[key]['_method'] = 'post' if key == 'rack.request.form_hash'
        end
      end
    end

    def create_strategy
      Warden::Strategies.add(:password) do
        def valid?
          params['user'] && params['user']['email'] && params['user']['password']
        end

        def authenticate!
          authenticated = AuthenticationService::Authenticate.call(
            email: params['user']['email'],
            password: params['user']['password']
          )

          success!(user) if authenticated
        end

        def user
          @user ||= User.find_by(email: params['user']['email'])
        end
      end
    end
  end
end