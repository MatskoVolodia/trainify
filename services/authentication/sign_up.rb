class AuthenticationService
  class SignUp < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      user = User.create(email: params[:email], password: params[:password])
      RegistrationMailer.new(email: params[:email]).send if user.persisted?

      user
    end

    private

    attr_reader :params
  end
end
