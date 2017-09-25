class AuthenticationService
  class SignUp < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      return unless policy.user_info_valid?

      user = User.create(email: params[:email], password: params[:password])
      RegistrationMailer.new(email: params[:email]).send if user.persisted?

      user
    end

    private

    attr_reader :params

    def policy
      @policy ||= UserPolicy.new(params)
    end
  end
end
