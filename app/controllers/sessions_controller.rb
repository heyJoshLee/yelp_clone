class SessionsController < ApplicationController

  def new
    flash[:danger] = "You are already logged in" if logged_in?
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      flash[:success] = "You ar  now logged in"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "There was an error with logging in"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out"
    redirect_to root_path
  end

end