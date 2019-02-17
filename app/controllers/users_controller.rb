class UsersController < ApplicationController
before_action :authenticate_user!, only:[:index, :destroy]
before_action :admin_user, only:[:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def admin_user
    redirect_to(root_url) uless current_user.admin?
  end
end
