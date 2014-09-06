class PupsController < ApplicationController
  before_action :set_pup, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
   @pups = Pup.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def show
  end

  def new
    @pup = current_user.pups.build
  end

  def edit
  end

  def create
    @pup = current_user.pups.build(pup_params)
    if @pup.save
      redirect_to @pup, notice: 'Pup was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @pup.update(pup_params)
      redirect_to @pup, notice: 'Pup was successfully updated.'
    else
      render action: 'edit'
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

    def correct_user
      @pup = current_user.pups.find_by(id: params[:id])
      redirect_to pups_path, notice: "Not authorized to edit this pup" if @pup.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pup_params
      params.require(:pup).permit(:description, :image)
    end
end