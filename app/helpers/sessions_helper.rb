module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    user.online = true
    user.last_login = Time.now
    user.ip = request.remote_ip
    user.save()
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def require_login()
    if !logged_in?
      redirect_to login_path
    end
  end
end
