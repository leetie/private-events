class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to(root_path)
    else
      flash.now = "Unable to create"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    if params.empty?
      
    else
      session[:id] = params[:id]
    end
    
  end

  def logout
    session[:id] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :username)
  end

end
