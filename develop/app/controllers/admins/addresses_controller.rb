class Admins::AddressesController < ApplicationController

  #before_action :authenticate_user!

  include DisplayAdminHeader


##途中です

  def new
    @address = Address.new(address_params)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address.save(address_params)
    redirect_to address_path
  end

  def update
    @address.update(address_params)
    redirect_to address_path
  end

  private
  def address_params
    params.require(:address).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :post_number, :address, :phone_number)
end




##途中です
