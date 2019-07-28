class Users::OrdersController < ApplicationController

  include DisplayUserHeader



  def new

    @user = current_user
    @current_address = @user.addresses.first
    if @current_address
    @order = Order.new
    @order_items = @order.order_items.build
    @user = current_user
    else
    redirect_to new_users_address_path
  end
  end


  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.each do |cart_item|
      @item = cart_item.item
      if @item.stock_quantity >= cart_item.sheet
        @item.decrement!(:stock_quantity, cart_item.sheet.to_i)
        cart_item.destroy
      else
        redirect_to users_carts_path
      end
    end
      @order.delivery_status = 0
      @order.save
      flash[:notice] = "購入ありがとうございました。カートは空です。"
      redirect_to users_user_path(current_user)
  end


private
 def order_params
    params.require(:order).permit(:user_id, :payment_method, :delivery_status, :address, :post_number, :family_name, :first_name, :phone_number, :total_price, :shipping_fee,
    :amount, order_items_attributes: [:id, :item_id, :sheet, :price, :_destroy])
end

end
