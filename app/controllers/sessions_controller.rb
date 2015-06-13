class SessionsController < ApplicationController

  def create
    binding.pry
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to albums_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
