class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = @user.topics.order(created_at: "DESC")
    @markers_json = @topics.map do |topic|
      [
        topic.id,
        topic.lat,
        topic.lng,
        topic.title,
        topic.content,
        topic.image.thumb.url
      ]
    end.to_json
  end
end