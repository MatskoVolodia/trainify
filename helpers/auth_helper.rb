module AuthHelper
  def auth_link
    link_to title, url
  end

  def url
    current_user ? '/profile' : '/auth/login'
  end

  def title
    current_user ? 'Profile' : 'Login'
  end
end