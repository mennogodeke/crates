class AlbumsController < ApplicationController
  load_and_authorize_resource
  def index
    @albums = Album.where('user_id' => current_user.id).all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = current_user.albums.build(format_id: params[:format_id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = current_user.albums.build(album_params)

    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
  end

  private
  def album_params
    unknown_property_keys = params[:album][:properties].try(:keys)
    params.require(:album).permit(:title, :artist_id, :label_id, :user_id, :cover, :description, :year, :format_id, { properties: unknown_property_keys})
  end
end
