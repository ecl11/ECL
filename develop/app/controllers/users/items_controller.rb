class Users::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
  end

  def add
  	@cart_item = Item.find(params[:id])
  	@cart_item.save
  	redirect_to cart_items_path
  end


  private
  def item_params
  	params.require(:item).permit(:product_name, :price, :jacket_image_id, :stock_quantity, :sales_status)
  end


end
