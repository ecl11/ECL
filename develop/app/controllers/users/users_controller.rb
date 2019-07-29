class Users::UsersController < ApplicationController

  include DisplayUserHeader

  def show
    @user = current_user
    @current_address = @user.addresses.first
    if @current_address #@user.ddresses.present?

      @orders = Order.where(user_id: current_user.id).page(params[:page]).per(3).order(id: "DESC")
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
     @user.update(user_params)
  
  end


  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/top'
     flash[:notice] = "退会しました"
  end



  private
  def user_params
  params.require(:user).permit(:email,:encrypted_password,:address_id, :family_name,:firstname,:kana_family_name,:kana_first_name,:phone_number　)
  end
  def address_params
    params.require(:address).permit(:post_number,:address)
  end

end
