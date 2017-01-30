class SongsController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.create(song_params)
    redirect_to album_path(@album)
  end

  def destroy
    @album = Album.find(params[:album_id])
    @song = @album.songs.find(params[:id])
    @song.destroy
    redirect_to album_path(@album)
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :featuring)
  end
end
