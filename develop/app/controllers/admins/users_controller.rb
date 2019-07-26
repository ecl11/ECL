class Admins::UsersController < ApplicationController

  include DisplayAdminHeader

  def index
<<<<<<< HEAD
    @user = User.all
    #@user = User.find
    @user = User.page(params[:page]).per(10).search(params[:search])
=======
    @users = User.page(params[:page]).per(20)
>>>>>>> master
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

   def user_params
  params.require(:user).permit(:email,:encrypted_password,:address_id, :family_name,:firstname,:kana_family_name,:kana_first_name,:phone_number,
                                address_attributes:[:id,:post_number,:address])
end

end
