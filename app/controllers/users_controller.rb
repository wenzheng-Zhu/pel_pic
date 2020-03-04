class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]


  def new
    @user = User.new
  end

  def show
    @pelcos = Pelco.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Pelco System #{@user.email}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  def update
    if @user.update(user_params)
      flash[:success] = "account was edited successfully!"
      redirect_to users_path
    else
      render 'edit'
    end

  end

  def edit

  end

  def destroy
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted!"
    redirect_to users_path
  end

  def index
    @users = User.all
  end


  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end



end
