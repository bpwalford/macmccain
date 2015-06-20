class SongsController < ApplicationController
  before_action :set_album, except: [:download_song, :download_album]

  def index
    @songs = @album.songs
    @album_path = @album.name.downcase.gsub(' ', '_')
  end

  def download_album
    song = params[:album]

    file = "#{album.downcase.gsub(' ', '_')}.zip"

    send_file("#{Rails.root}/public/albums/#{file}")
  end

  def download_song
    song  = params[:song]
    album = params[:album]

    song_file = "#{song.downcase.gsub(' ', '_')}.mp3"
    album_dir = album.downcase.gsub(' ', '_')

    send_file(
      "#{Rails.root}/public/#{album_dir}/#{song_file}",
      filename: "#{song.gsub(' ', '-')}.mp3",
      type: "application/mp3"
    )
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:title, :price)
  end

end
