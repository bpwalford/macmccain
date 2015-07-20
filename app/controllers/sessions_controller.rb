class SessionsController < ApplicationController

  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.admin == true
        redirect_to admin_home_path
      else
        session.destroy
        raise AccessDenied
      end
    else
      redirect_to sign_in_path, notice: 'username or password was not valid'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
