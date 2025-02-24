module Loginable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  private

  def require_login
    return if logged_in?

    redirect_to new_session_path, notice: "ろぐいんしてくれ"
  end

  def logged_in? = current_user.present?

  def current_user
    @current_user ||= (session[:user_id] && User.find_by(id: session[:user_id]))
  end
end
