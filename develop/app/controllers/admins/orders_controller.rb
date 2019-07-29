class Admins::OrdersController < ApplicationController

  include DisplayAdminHeader

before_action :authenticate_admin!
  def index

  	@orders = Order.all
  	@orders = Order.page(params[:page]).per(20).order(id: "DESC")

  end

  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
    # @order_items = OrderItem.includes(:item)
    @user = @order.user
    # @user = User.includes(:address)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.save
      flash[:notice] = "You have creatad delivery status successfully."
      redirect_to admins_order_path(@order)
    end
  end

  private
    def order_params
        params.require(:order).permit(:delivery_status)
    end
end
