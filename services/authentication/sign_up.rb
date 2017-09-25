class AuthenticationService
  class SignUp < ApplicationService
    def initialize(params)
      @email    = params[:email]
      @password = params[:password]
    end

    def call
      user = User.create(email: email, password: password)
      RegistrationMailer.new(email: email).send if user.persisted?

      user
    end

    private

    attr_reader :email, :password
  end
end
