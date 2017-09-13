module AuthHelper
  def auth_link
    @authorized = AuthenticationService::CurrentUser.call(env)

    link_to title, url
  end

  def url
    authorized ? '/profile' : '/auth/login'
  end

  def title
    authorized ? 'Profile' : 'Login'
  end

  attr_reader :authorized
end