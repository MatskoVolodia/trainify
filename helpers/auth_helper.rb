module AuthHelper
  def auth_link
    link_to title, url
  end

  def url
    authorized ? '/profile' : '/auth/login'
  end

  def title
    authorized ? 'Profile' : 'Login'
  end

  def authorized
    @authorized ||= AuthenticationService::CurrentUser.call(env)
  end
end