class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    end
    @disable_nav = true
  end
  def create
    @disable_nav = true
    if game_over?
      flash[:alert] = '比賽已經結束'
      redirect_to root_path
    else
      user = User.find_by(sid: params[:session][:sid].downcase)
      if user && user.password == params[:session][:password]
        log_in user
        redirect_to root_path
      else
        flash[:alert] = '帳號/密碼錯誤，或是你沒有報名'
        render 'new'
      end
    end
  end
  def destroy
    user = User.find(session[:user_id])
    user.online = false
    user.save()
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
