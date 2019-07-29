class Users::ItemsController < ApplicationController

  include DisplayUserHeader

  def index
    @items = Item.page(params[:page]).per(30).search(params[:search]).order(id: "DESC")
    #@count = Item.search
   end


def show
    @item = Item.find(params[:id])
    @discs = @item.discs.all
    @user = current_user
    if user_signed_in?
      @cart_items = @user.cart_items
      @current_item = @user.cart_items.find_by(item_id: @item.id)

      if  @current_item
        @cart_item = CartItem.find(@current_item.id)
      else
        @cart_item = CartItem.new
      end
    end
  end




  private
  def item_params
    params.require(:item).permit(:product_name, :price, :jacket_image, :remove_jacket_image, :stock_quantity, :sales_status, discs_attributes: [:id, :disc_name, :_destroy,
                                                         songs_attributes: [:id, :song_name, :song_turn, :_destroy]])
  end

end
