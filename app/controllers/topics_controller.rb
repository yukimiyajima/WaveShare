class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :destroy]
  before_action :set_topics, only: [:home, :index, :create]

  def home
    @markers_json = Topic.pluck(:id, :lat, :lng, :title, :content).to_json
  end

  def index
  end

  def show
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
        redirect_to home_url
      else
        render :new
      end
  end

  def destroy
    @topic.destroy
    redirect_to home_url
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
end