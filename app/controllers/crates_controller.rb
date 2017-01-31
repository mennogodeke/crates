class CratesController < ApplicationController
  def index
    @crates = Crate.all
  end

  def show
    @crate = Crate.find(params[:id])
  end

  def new
    @crate = Crate.new
  end

  def edit
    @crate = Crate.find(params[:id])
  end

  def create
    @crate = Crate.new(crate_params)

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
    params.require(:crate).permit(:name, :description)
  end
end
