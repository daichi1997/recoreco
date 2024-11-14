class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/recos/#{comment.reco.id}"  
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, reco_id: params[:reco_id])
  end

end
