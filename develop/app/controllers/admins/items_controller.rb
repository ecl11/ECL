class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
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
        redirect_to root_path
      else
        @items = Item.all
        render :index
      end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, discs_attributes: [:id, :disc_name, :_destroy,
                                                         songs_attributes: [:id, :song_name, :song_turn, :_destroy]])
  end
end

