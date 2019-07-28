class Users::UsersController < ApplicationController

  include DisplayUserHeader

  def show
    @user = current_user
    @current_address = @user.addresses.first
    if @current_address #@user.ddresses.present?

      @orders = Order.where(user_id: current_user.id).page(params[:page]).per(3)
      @items = Item.all#
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
    if params[:user][:encrypted_password].blank?
      params[:user].delete("encrypted_password")
    end
    if @user.update(user_params)
      redirect_to users_user_path(@user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @address = Address.find_by(user_id: params[:id])
    @orders = Order.find_by(user_id: params[:id])
    if @orders.nil?
      @user.destroy
      @address.destroy
      flash[:notice] = "退会しました"
      redirect_to "/top"
    else
      @orders.destroy
      @user.destroy
      @address.destroy
      flash[:notice] = "退会しました"
      redirect_to "/top"
    end


  end


  private
  def user_params
  params.require(:user).permit(:email,:encrypted_password,:address_id, :family_name,:firstname,:kana_family_name,:kana_first_name,:phone_number)
  end
  def address_params
    params.require(:address).permit(:post_number,:address)
  end

end
