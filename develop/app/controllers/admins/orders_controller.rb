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
  end
end
