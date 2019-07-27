class Users::OrdersController < ApplicationController

  include DisplayUserHeader



  def new
    @user = current_user
    @order = Order.new
    @order_item = @order.order_items.build
  end


  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @sheet = current_user.cart_item.sheet  #色々と書き換えたり@order.saveを先に持ってきて =order.cart_itemなどにしてみてもcart_itemで同じエラーを吐く。リレーションに何か問題？
    @stock = current_user.cart_item.item.stock_quantity

    if @stock >= @sheet
      @stock -= @sheet
      @stock.save
      @order.save
      current_user.cart_item.destroy
      flash[:notice] = "購入しました。カートは空です。"
      redirect_to users_user_path(current_user)
    else
      @items = Item.all
      redirect_to users_items_path #カートに戻す＋在庫数より多く注文はできませんメッセージ入れる
      end
  end


private
 def order_params
    params.require(:order).permit(:user_id, :payment_method, :delivery_status, :address, :post_number, :family_name, :first_name, :phone_number, :total_price, :shipping_fee,
    :amount, order_items_attributes: [:id, :item_id, :sheet, :price, :_destroy])
end

end
