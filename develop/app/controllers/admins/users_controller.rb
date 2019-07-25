class Admins::UsersController < ApplicationController

  include DisplayAdminHeader

  def index
    @user = User.all
    #@user = User.find
    @user = User.page(params[:page]).per(10).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  

end
