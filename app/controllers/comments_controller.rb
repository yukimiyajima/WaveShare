class CommentsController < ApplicationController
  before_action :set_topic, only: [:create, :edit, :update]

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comments = @comment.topic.comments.order(created_at: 'DESC')
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to home_path , notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @topic.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comments = @comment.topic.comments.order(created_at: 'DESC')
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    @comments = @comment.topic.comments.order(created_at: 'DESC')
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

end