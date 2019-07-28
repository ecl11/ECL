class Users::UsersController < ApplicationController

  include DisplayUserHeader

  def show
    @user = current_user
    @current_address = @user.addresses.first
    if @current_address #@user.ddresses.present?
        @address = Address.find_by(post_number: params[:post_number],address: params[:address])
        @address = @user.addresses.all
        @orders = @user.orders
        @orders = Order.page(params[:page]).per(3)
    else
        redirect_to new_users_address_path
    end
  end

  def edit
    @user = User.find(params[:id])
   @user.addresses.build #意味は？
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_user_path(@user.id)
    else
      end
  end


  private
  def user_params
  params.require(:user).permit(:email,:encrypted_password,:address_id, :family_name,:firstname,:kana_family_name,:kana_first_name,:phone_number,
                                address_attributes:[:id,:post_number,:address])
  end
  def address_params
    params.require(:address).permit(:post_number,:address)
  end

end
