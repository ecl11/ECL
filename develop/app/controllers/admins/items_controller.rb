class Admins::ItemsController < ApplicationController
  def index
      @items = Item.page(params[:page]).per(20)
  end

  def show
    @item = Item.find(params[:id])
    @discs =@item.discs
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
        @disc.songs.build

  end

  def create
    @item = Item.new(item_params)
      if @item.save
                    redirect_to admins_items_path

      else
        @items = Item.all
        render :index
      end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
  if @item.update(item_params)
redirect_to admins_item_path(@item.id)
  else
        @items = Item.all
        render :index
end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :jacket_image, :remove_jacket_image, :stock_quantity, :sales_status, discs_attributes: [:id, :disc_name, :_destroy,
                                                         songs_attributes: [:id, :song_name, :song_turn, :_destroy]])
  end
end

