class ApplicationController < ActionController::Base
  # code to enable methods to be usable in views
  helper_method :current_chef,:logged_in?
  def current_chef
    # if current_chef is already explored no need to hit database
    # just use ||= operator
   @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
    # this line is going to be returned
  end

  def logged_in?
    # !! turns any expression into true or false
    !!current_chef
  end

  def require_user
    if !logged_in?
      falsh[:danger]="No user is currently logged in"
      redirect_to root_path
    end
  end
end
