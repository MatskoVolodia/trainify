class RegistrationMailer < ApplicationMailer
  REGISTRATION_MESSAGE = 'Hi, you registered on Trainify. Farewell.'.freeze
  REGISTRATION_SUBJECT = 'Trainify registration'.freeze

  def initialize(params)
    @params = params
  end

  def send
    super(
      email:   email,
      message: REGISTRATION_MESSAGE,
      subject: REGISTRATION_SUBJECT
    )
  end

  private

  attr_reader :params

  def email
    @email ||= params[:email]
  end
end