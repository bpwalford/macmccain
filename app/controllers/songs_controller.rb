class SongsController < ApplicationController
  before_action :set_album, except: [:download_song, :download_album]

  def index
    @songs = @album.songs
    @album_path = @album.name.downcase.gsub(' ', '_')
  end

  def download_album
    # song = params[:album]

    # file = "#{album.downcase.gsub(' ', '_')}.zip"

    # send_file("#{Rails.root}/public/albums/#{file}")
  end

  def download_song
    song  = Song.find_by(id: params[:song])
    album = Album.find_by(id: params[:album])

    song_file = "#{song.format_name.downcase}.mp3"
    album_dir = album.format_name.downcase

    song.downloads ? song.downloads += 1 : song.downloads = 1
    song.save

    send_file(
      "#{Rails.root}/public/#{album_dir}/#{song_file}",
      filename: "#{song.format_name}.mp3",
      type: "application/mp3"
    )
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

end
