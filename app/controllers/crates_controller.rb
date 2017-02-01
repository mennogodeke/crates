class CratesController < ApplicationController
  skip_before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @crates = Crate.all
  end

  def show
    @crate = Crate.find(params[:id])
  end

  def new
    @crate = current_user.crates.build
  end

  def edit
    @crate = Crate.find(params[:id])
  end

  def create
    @crate = current_user.crates.build(crate_params)

    if @crate.save
      redirect_to @crate
    else
      render 'new'
    end
  end

  def update
    @crate = Crate.find(params[:id])

    if @crate.update(crate_params)
      redirect_to @crate
    else
      render 'edit'
    end
  end

  def destroy
    @crate = Crate.find(params[:id])
    @crate.destroy

    redirect_to crates_path
  end

  private
  def crate_params
    params.require(:crate).permit(:name, :description, :user_id)
  end
end
