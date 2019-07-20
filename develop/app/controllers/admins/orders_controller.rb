class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
    @user = @order.user
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.save
      flash[:notice] = "You have creatad delivery status successfully."
      redirect_to order_path(@order)
    end
  end

  private
    def order_params
        params.require(:order).permit(:delivery_status)
    end
end
