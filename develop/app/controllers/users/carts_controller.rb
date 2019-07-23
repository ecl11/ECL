class Users::CartsController < ApplicationController

  def index
    @user = current_user
  	@cart_items = CartItem.all
    @item = Item
  end

    def show
      @user = current_user

     @cart_item = CartItem.find(params[:id])
end

  def create
  	@cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to users_carts_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to users_carts_path
  end

  def destroy
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
  	redirect_to users_carts_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:id, :user_id, :item_id, :sheet)
  end
end
