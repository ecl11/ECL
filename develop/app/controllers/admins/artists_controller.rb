class Admins::ArtistsController < ApplicationController

  before_action :authenticate_user!

  include DisplayAdminHeader

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to new_admins_item_path
  end

  def edit
    @artisit = Artist.find(params[:id])
  end

  def update
    @artisit = Artist.find(params[:id])
    @artisit.update(artist_params)
    redirect_to item_path
  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end