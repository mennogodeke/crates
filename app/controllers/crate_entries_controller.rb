class CrateEntriesController < ApplicationController
  skip_before_action :authenticate_user!
  load_and_authorize_resource
  def create
    @crate = Crate.find(params[:crate_id])
    @crate_entry = @crate.crate_entries.create(crate_entry_params)
    redirect_to crate_path(@crate)
  end

  def destroy
    @crate = Crate.find(params[:crate_id])
    @crate_entry = @crate.crate_entries.find(params[:id])
    @crate_entry.destroy
    redirect_to crate_path(@crate)
  end

  private
  def crate_entry_params
    params.require(:crate_entry).permit(:album_id, :crate_id)
  end
end
