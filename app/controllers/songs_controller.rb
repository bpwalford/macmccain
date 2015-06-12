class SongsController < ApplicationController
  before_action :set_album
  before_action :set_song, only: [:show, :update]


  def index
    @songs = @album.songs
  end

  def show
  end

  def update
    if @song.save(song_params)
      redirect_to songs_path(@album, @song), notice: "#{@song.title} successfully updated"
    else
      render :new
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def set_album
    @album = Album.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:title, :price)
  end

end
