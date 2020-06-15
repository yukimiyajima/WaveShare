class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = @user.topics
    @markers_json = @topics.map do |topic|
      [
        topic.id,
        topic.lat,
        topic.lng,
        topic.title,
        topic.content,
        topic.image.url
      ]
    end.to_json
  end
end