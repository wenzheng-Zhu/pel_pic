class SessionsController < ApplicationController
  def new
  end

  def destroy
  	session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.anthenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully signed in~"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There's something wrong with your login infos!"
      render 'new'
    end
  end
end
