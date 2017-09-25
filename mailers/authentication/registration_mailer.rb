class RegistrationMailer < ApplicationMailer
  REGISTRATION_MESSAGE = 'Hi, you registered on Trainify. Farewell.'.freeze
  REGISTRATION_SUBJECT = 'Trainify registration'.freeze

  protected

  def mailing_params
    {
        email:   params[:email],
        message: REGISTRATION_MESSAGE,
        subject: REGISTRATION_SUBJECT
    }
  end
end