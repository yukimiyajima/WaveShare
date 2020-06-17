class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(topic_id: params[:topic_id])
    @topic = @like.topic
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @topic = @like.topic
  end

  def index
    @user = User.find(params[:user_id])
    @topics = @user.like_topics.order(created_at: "DESC")
    @markers_json = @topics.map do |topic|
      [
        topic.id,
        topic.lat,
        topic.lng,
        topic.content,
        topic.image.thumb.url,
        topic.user.icon.thumb.url,
      ]
    end.to_json
  end

  def users
    topic = Topic.find(params[:topic_id])
    @users = topic.like_users
  end
  
end