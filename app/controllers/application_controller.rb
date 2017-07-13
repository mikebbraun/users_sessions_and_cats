class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    # caching
    # memoization
    @current_user ||= User.find_by(id: session[:user_id])
    # if @current_user
    # ....
    # else
    #   @current_user = User.find_by...
    # end
  end
  helper_method :current_user

  def require_logged_in
  #  if current_user
  #    true
  #  else
  #    redirect_to root_path
  #  end
    redirect_to root_path unless current_user
  end
end
