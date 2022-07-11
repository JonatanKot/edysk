class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      session[:folder_id] = @user.folder.id
      redirect_to users_path
    else

      message = "Nieprawidlowy login lub haslo"
      redirect_to login_path, notice: message
    end
  end
  
  def destroy
  
    reset_session
    redirect_to "/login"
  end
end
