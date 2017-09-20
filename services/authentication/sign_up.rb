class AuthenticationService
  class SignUp < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      if UserPolicy.new(params).user_info_valid?
        if email_available?
          User.create(email: params[:email], password: params[:password])
          RegistrationMailer.new(email: params[:email]).send
          :success
        else
          :email_unavailable
        end
      else
        :invalid_parameters
      end
    end

    private

    attr_reader :params

    def email_available?
      users.count.zero?
    end

    def users
      @users ||= User.where(email: params[:email])
    end
  end
end
