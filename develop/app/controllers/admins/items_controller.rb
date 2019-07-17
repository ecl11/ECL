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
    @song = @disc.songs.build
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        @items = Item.all
        render :index
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
