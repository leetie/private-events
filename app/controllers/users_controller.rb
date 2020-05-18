class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
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

  def set_user
    @user = User.find(params[:id])
  end
end
