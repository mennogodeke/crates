class SongsController < ApplicationController
  skip_before_action :authenticate_user!
  load_and_authorize_resource
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
