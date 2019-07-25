class Users::AddressesController < ApplicationController

  include DisplayUserHeader

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @address.save
    redirect_to users_items_path
  end

  def update
    @address.update(address_params)
    redirect_to edit_users_user_path
  end

  private
  def address_params
    params.require(:address).permit(:user_id, :family_name, :first_name, :kana_family_name, :kana_first_name, :post_number, :address, :phone_number)
  end
end
