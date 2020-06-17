class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(topic_id: params[:topic_id])
    @topic = @like.topic
    @likes_count = Like.where(topic_id: @topic.id).count
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @topic = @like.topic
    @likes_count = Like.where(topic_id: @topic.id).count
  end
end