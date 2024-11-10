class RecosController < ApplicationController

  def index
    @recos = Reco.all
  end

  def new
    @reco = Reco.new
  end

  def create
    Reco.create(reco_params)
    redirect_to '/'
  end

  def destroy
    reco = Reco.find(params[:id])
    reco.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    reco = reco.find(params[:id])
    reco.update(reco_params)
    redirect_to root_path
  end

  def show
  end

  private
  def reco_params
    params.require(:reco).permit(:title,:content,:image).merge(user_id: current_user.id)
  end


end
