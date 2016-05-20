class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to root_path
    else
      flash.now[:danger] = "There was an error"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

end