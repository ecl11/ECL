class Users::CartsController < ApplicationController
  def index
  	@cart_items = Cart_item.all
  end

  def create
  	@cart_item = CartItem.new
    @cart_item.save
  end

  def update
  end

  def destroy
  	@cart_item = Cart_item.find(params[:id])
  	@cart_item.destroy
  	redirect_to users_carts
  end
end
