class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :destroy]
  before_action :set_topics, only: [:home, :index, :create]
  before_action :ensure_correct_user, only: [:destroy]
  before_action :authenticate_user!

  def home
    @markers_json = Topic.all.map do |topic|
      [
        topic.id,
        topic.lat,
        topic.lng,
        topic.title,
        topic.content,
        topic.image.thumb.url,
        topic.user.icon.thumb.url,
      ]
    end.to_json
  end

  def index
  end

  def show
    @like = current_user.likes.find_by(topic_id: @topic.id)
    @comments = @topic.comments
    @comment = @topic.comments.build
  end

  def new
    @topic = Topic.new(
      lat: params[:latitude], 
      lng: params[:longitude],
    )
  end

  def create
    @topic = current_user.topics.build(topic_params)
      if @topic.save
        redirect_to root_path
      else
        render :new
      end
  end

  def destroy
    @topic.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_topics
    @topics = Topic.all.order(created_at: "DESC")
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :lat, :lng, :image)
  end

  def ensure_correct_user
    @topic = Topic.find(params[:id])
    if @topic.user_id != current_user.id
      redirect_to root_path
    end
  end
end