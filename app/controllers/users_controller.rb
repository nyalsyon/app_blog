class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:udate,:show,:destroy]
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
  def create
      if @user = User.new(user_params)
        @user.save
        flash[:notice] = "New user successfully created."
        redirect_to user_path(@user)
      else
        render 'new'
    end
  end
  def edit
  end
  def update
      if(@user.update(user_params))
        @user.save
        flash[:notice] = "User successfully udated."
        redirect_to user_path(@user)
      else
        render 'edit'
    end
  end
  def destroy
    @user.destroy
    flash[:notice] = "User sucessfully deleted."
    redirect_to users_path
  end

  private
  def set_user
    @user=User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username,:password,:email)
  end
end
