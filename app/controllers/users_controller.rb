class UsersController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> 1ce535fc43d2ca10e9a777e7d1e1198157d32b93
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
<<<<<<< HEAD
    if @user.save 
      redirect_to(root_path)
    else
      flash.now = "Unable to create"
      render :new
=======

    if @user.save
      redirect_to user_path(@user)
>>>>>>> 1ce535fc43d2ca10e9a777e7d1e1198157d32b93
    end
  end

  def show
    @user = User.find(params[:id])
  end

<<<<<<< HEAD
  def login
    if params.empty?
      
    else
      session[:id] = params[:id]
    end
    
  end

  def logout
    session[:id] = nil
=======
  def sign_in
    if User.exists?(params[:id])
      cookies.permanent[:id] = params[:id]
    end
    redirect_to new_user_path
  end

  def sign_out
    cookies.delete(:id)
>>>>>>> 1ce535fc43d2ca10e9a777e7d1e1198157d32b93
    redirect_to root_path
  end

  private
<<<<<<< HEAD
  def user_params
    params.require(:user).permit(:name, :username)
  end

=======

  def user_params
    params.require(:user).permit(:name, :username)
  end
>>>>>>> 1ce535fc43d2ca10e9a777e7d1e1198157d32b93
end
