class UserController < ApplicationController
  def login
    @disable_nav = true
  end
  def logout
    redirect_to(user_login_path)
  end
end
