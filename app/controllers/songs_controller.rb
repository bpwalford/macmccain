class SongsController < ApplicationController
  before_action :set_album

  def index
    @songs = @album.songs
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:title, :price)
  end

end
