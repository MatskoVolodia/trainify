class ApplicationMailer
  APPLICATION_EMAIL = 'trainify@gmail.com'.freeze
  
  def self.send(*args)
    new(*args).send
  end

  def send(params)
    Thread.new do
      Pony.mail(
        to:      params[:email],
        body:    params[:message],
        subject: params[:subject],
        from:    APPLICATION_EMAIL,
        via:     :sendmail,
        headers: { 'Content-Type': 'text/html' }
      )
    end
  end
end
