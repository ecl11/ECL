class Admins::ArtistsController < ApplicationController
  def new
    @artist = Artist.new(artist_params)
  end

  def create
    @artist.save
    redirect_to item_path
  end

  def edit
    @artisit = Artist.find(params[:id])
  end

  def update
    @artisit.update(artist_params)
    redirect_to item_path
  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end