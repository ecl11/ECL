class Users::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order_items = @order.order_items.build
    @user = current_user
  end
 

  def create
  	    @order.user_id = current_user.id

  	    @order = Order.new(order_params)

      if @order.save
         redirect_to users_user_path(current_user.id)

      else
        @items = Item.all
        render :index
      end

  end
private
 def order_params
    params.require(:order).permit(:payment_method, :delivery_status, :address, :post_number, :family_name, :first_name, :phone_number, :total_price, :shipping_fee, :amount, order_items_attributes: [:id, :item_id, :sheet, :price, :_destroy])
end
end
