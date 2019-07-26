class Admins::UsersController < ApplicationController

  include DisplayAdminHeader

  def index

    @user = User.all
    #@user = User.find
    @user = User.page(params[:page]).per(10)
    @user = User.search(params[:search])

    @users = User.page(params[:page]).per(20)

  end

  def show
    @user = User.find(params[:id])
    @address = @user.addresses.all
    @orders = @user.orders
    @orders = Order.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
    @user.addresses.build
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_user_path(@user.id)
    else
      end
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
