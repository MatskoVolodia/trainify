class ApplicationMailer
  FROM_EMAIL = 'vm@leobit.co'.freeze

  def self.send(*args)
    new(*args).send
  end

  def initialize(params = {})
    @params = params
  end

  def send
    Thread.new { Pony.mail(payload) }
  end

  protected

  def mailing_params
    raise NotImplementedError, 'You have to implement this method in the subclass'
  end

  private

  def payload
    defaults.merge(mailing_params)
  end

  attr_reader :params

  def defaults
    {
        from:    FROM_EMAIL,
        via:     :sendmail,
        headers: {
            'Content-Type': 'text/html'
        }
    }
  end
end