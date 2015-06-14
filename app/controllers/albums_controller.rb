class AlbumsController < ApplicationController
  before_action :set_album, except: [:index]

  def index
    @albums = Album.all.sort_by { |album| album.name.downcase }
  end

  def show
  end

  def update
    if @ablum.save(album_params)
      redirect_to albums_path, notice: "#{@album.name} successfully updated"
    else
      render :new
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :price, :artist)
  end

end
