class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to topic_path(@topic) , notice: '投稿できませんでした' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end