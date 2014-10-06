class UsersController < ApplicationController
  before_action :require_user, only: [:update, :edit]
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are registered."
      redirect_to root_path
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated."
      redirect_to root_path
    else
      render :edit
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
