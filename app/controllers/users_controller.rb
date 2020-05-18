class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_in
    if User.exists?(params[:id])
      cookies.permanent[:id] = params[:id]
    end
    redirect_to new_user_path
  end

  def sign_out
    cookies.delete(:id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
