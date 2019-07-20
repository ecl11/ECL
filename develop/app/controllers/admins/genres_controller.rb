class Admins::GenresController < ApplicationController

  def new
    @genre = Genre.new(genre_params)
  end

  def create
    @genre.save
    redirect_to item_path
  end

  def edit
    @genre = Genre.find[:id](params[:id])
  end

  def update
    @genre.update(genre_params)
    redirect_to item_path
  end

private
def genre_params
  params.require(:genre).permit(:genre_name)

end