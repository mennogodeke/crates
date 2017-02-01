class FormatsController < ApplicationController
  before_action :set_format, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /formats
  # GET /formats.json
  def index
    @formats = Format.all
  end

  # GET /formats/1
  # GET /formats/1.json
  def show
  end

  # GET /formats/new
  def new
    @format = Format.new
  end

  # GET /formats/1/edit
  def edit
  end

  # POST /formats
  # POST /formats.json
  def create
    @format = Format.new(format_params)
      if @format.save
        redirect_to @format, notice: 'Format was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /formats/1
  # PATCH/PUT /formats/1.json
  def update
    if @format.update(format_params)
      redirect_to @format, notice: 'Format was successfully updated.'
    else
       render :edit
    end
  end

  # DELETE /formats/1
  # DELETE /formats/1.json
  def destroy
    @format.destroy
    respond_to do |format|
      format.html { redirect_to formats_url, notice: 'Format was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_format
      @format = Format.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def format_params
      params.require(:format).permit(:name, fields_attributes:[:field_type, :name, :required, :_destroy])
    end
end
