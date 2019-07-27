class Users::AddressesController < ApplicationController

  include DisplayUserHeader

  def new
    @address = Address.new
  end

  def edit
    @address = Address.where(user_id: current_user.id)
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @address.save
    if @address == current_user.addresses.first
      redirect_to users_items_path
    else
      redirect_to edit_users_user_path(current_user)
    end
  end

  def update
    @address.update(address_params)
    redirect_to edit_users_address_path
  end

  private
  def address_params
    params.require(:address).permit(:id, :user_id, :family_name, :first_name, :kana_family_name, :kana_first_name, :post_number, :address, :phone_number)
  end
end
