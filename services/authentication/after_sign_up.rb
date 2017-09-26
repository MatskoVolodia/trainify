class AuthenticationService
  class AfterSignUp < ApplicationService
    EMAIL_UNAVAILABLE_NOTICE  = 'This email is registered.'.freeze
    INVALID_PARAMETERS_NOTICE = 'Please, fill form properly.'.freeze
    SIGN_UP_PATH              = '/auth/signup'.freeze

    def initialize(result)
      @result = result
    end

    def call
      return continue_with(INVALID_PARAMETERS_NOTICE, SIGN_UP_PATH) if result.nil?
      return continue_with(EMAIL_UNAVAILABLE_NOTICE, SIGN_UP_PATH)  if result&.id.nil?
      return continue_with(nil, '/')                                if result.id
    end

    private

    attr_reader :result

    def continue_with(notice, redirect_path)
      {
        notice:        notice,
        redirect_path: redirect_path
      }
    end
  end
end
