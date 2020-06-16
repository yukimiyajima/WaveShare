class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @topics = @user.topics.order(created_at: "DESC")
    @markers_json = @topics.map do |topic|
      [
        topic.id,
        topic.lat,
        topic.lng,
        topic.title,
        topic.image.thumb.url,
        topic.user.icon.thumb.url,
      ]
    end.to_json
  end
end