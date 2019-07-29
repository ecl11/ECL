class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  include DisplayAdminHeader

  def index

    @user = User.all
    #@user = User.find
    #@user = User.search(params[:search])
    @user = User.page(params[:page]).per(20).search(params[:search]).order(id: "DESC")

    #@users = User.page(params[:page]).per(20)

  end

  def show
    @user = User.find(params[:id])
    #@address = Address.find_by(post_number: params[:post_number],address: params[:address])
    #@address = @user.addresses.all
    @orders = @user.orders.page(params[:page]).per(3).order(id: "DESC")
    #@orders = Order.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
    @user.addresses.build
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user.id)
    else
      end
  end

  def destroy
    @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "退会させました"
      redirect_to admins_user_path
 end

  private

   def user_params
  params.require(:user).permit(:email,:encrypted_password,:address_id, :family_name,:firstname,:kana_family_name,:kana_first_name,:phone_number,
                                address_attributes:[:id,:post_number,:address])
end

end
