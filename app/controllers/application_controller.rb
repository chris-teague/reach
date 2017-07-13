class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user_token_in_session

  helper_method :current_user, :logged_in?

  def set_user_token_in_session
    if params["userToken"].present?
      if user = User.where(token: params["userToken"]).first
        session[:user_id] = user.id
      end
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
