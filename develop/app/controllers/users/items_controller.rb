class Users::ItemsController < ApplicationController

  include DisplayUserHeader

  def index
    @items = Item.page(params[:page]).per(20).search(params[:search])
  end

  def show
  	@item = Item.find(params[:id])
    @discs = @item.discs.all
    @cart_item = CartItem.new
  end


  private
  def item_params
    params.require(:item).permit(:product_name, :price, :jacket_image, :remove_jacket_image, :stock_quantity, :sales_status, discs_attributes: [:id, :disc_name, :_destroy,
                                                         songs_attributes: [:id, :song_name, :song_turn, :_destroy]])
  end

end
