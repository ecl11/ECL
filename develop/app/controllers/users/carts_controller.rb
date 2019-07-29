class Users::CartsController < ApplicationController

  before_action :authenticate_user!

  include DisplayUserHeader

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
    if @cart_item.item.stock_quantity.to_i >= @cart_item.sheet.to_i
    redirect_to users_carts_path
    else
    @cart_item.destroy
    redirect_to users_carts_path
    flash[:notice] = "在庫より注文数量が多い商品があります"
  end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    if @cart_item.item.stock_quantity.to_i >= @cart_item.sheet.to_i
    redirect_to users_carts_path
    else
    @cart_item.destroy
    redirect_to users_carts_path
    flash[:notice] = "在庫より注文数量が多い商品があります"

  end
end

  def destroy
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
  	redirect_to users_carts_path
  end

def add_item(item_id)

    current_item = @user.cart_items.find_by_item_id(item_id)

    if  current_item
          current_item.update(cart_item_params)


    else
      current_item = @user.cart_items.build(cart_item_params)
      @cart_item.save
    end

  end




  private
  def cart_item_params
    params.require(:cart_item).permit(:id, :user_id, :item_id, :sheet)
  end
end
