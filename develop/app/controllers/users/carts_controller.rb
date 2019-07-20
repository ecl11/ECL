class Users::CartsController < ApplicationController
  def index
  	@cart_items = CartItem.all
  end

  def create
  	@cart_item = Item.find(params_items)
    @cart_item.save
  end

  def update
  end

  def destroy
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
  	redirect_to users_carts
  end
end
