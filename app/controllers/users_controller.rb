class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # TODO add admin side to browse users
  # def index
  # end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to albums_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end