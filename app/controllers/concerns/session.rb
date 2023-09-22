module Session
  extend ActiveSupport::Concern

  def require_login
    unless logged_in?
      alert "Please log in to access this page."
      redirect_to root_url
    end
  end

  def logged_in?
    !!session[:operator_id]
  end
end
