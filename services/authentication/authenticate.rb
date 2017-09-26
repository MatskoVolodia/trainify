class AuthenticationService
  class Authenticate < ApplicationService
    delegate :password_digest, to: :user, prefix: true

    def initialize(params)
      @email              = params[:email]
      @attempted_password = params[:password]
    end

    def call
      user_password == attempted_password
    end

    private

    attr_reader :email, :attempted_password

    def user
      @user ||= User.find_by(email: email)
    end

    def user_password
      BCrypt::Password.new(user_password_digest) if user
    end
  end
end
