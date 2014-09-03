class PupsController < ApplicationController
  before_action :set_pup, only: [:show, :edit, :update, :destroy]

  
  def index
    @pups = Pup.all
  end


  def show
  end


  def new
    @pup = Pup.new
  end


  def edit
  end


  def create
    @pup = Pup.new(pup_params)

    if @pup.save
      redirect_to @pup, notice: 'Pup was successfully created.'
    else
      render :new
    end
  end


  def update
    if @pup.update(pup_params)
      redirect_to @pup, notice: 'Pup was successfully updated.'
    else
      render :edit 
    end
  end

  

  def destroy
    @pup.destroy
    redirect_to pups_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pup
      @pup = Pup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pup_params
      params.require(:pup).permit(:description)
    end
end