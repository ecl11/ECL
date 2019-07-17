class Users::ItemsController < ApplicationController
  def index
  	@items = Itemn.all
  end

  def show
  	@item = Item.find(params[:id])
  end
end
