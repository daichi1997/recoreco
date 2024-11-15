class RecosController < ApplicationController
  before_action :set_reco, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recos = Reco.all.order(created_at: params[:sort] == 'asc' ? :asc : :desc)
  end


  def show
    @comment = Comment.new
    @comments = @reco.comments.includes(:user)
  end

  def new
    @reco = Reco.new
  end

  def create
    @reco = current_user.recos.build(reco_params)
    if @reco.save
      if params[:reco][:images]
        params[:reco][:images].each do |image|
          @reco.images.attach(image)
        end
      end
      redirect_to @reco, notice: '記事が正常に作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reco.update(reco_params)
      if params[:reco][:images]
        params[:reco][:images].each do |image|
          @reco.images.attach(image)
        end
      end
      redirect_to @reco, notice: '記事が正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @reco.destroy
    redirect_to recos_url, notice: '記事が正常に削除されました。'
  end

  private

  def set_reco
    @reco = Reco.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to recos_path, alert: '指定された記事が見つかりません。'
  end

  def reco_params
    params.require(:reco).permit(:title, :content,  {images: []}).merge(user_id: current_user.id)
  end
end