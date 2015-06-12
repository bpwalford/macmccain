class AlbumsController < ApplicationController
  before_action :set_album, except: [:index]

  def index
    @albums = Album.all
  end

  def show
  end

  def update
    if @ablum.save
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
