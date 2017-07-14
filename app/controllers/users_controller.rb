require 'pry'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    if current_user && current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :tickets, :height, :nausea, :admin)
  end
end
