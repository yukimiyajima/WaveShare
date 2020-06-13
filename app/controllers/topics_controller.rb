class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :destroy]

  def home
    @topics = Topic.all
    @markers_json = Topic.pluck(:id, :lat, :lng, :content).to_json
  end

  def index
    @topics = Topic.all
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
    @topics = Topic.all
    @topic = Topic.new(topic_params)
      if @topic.save
        render :index
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

  def topic_params
    params.require(:topic).permit(:title, :content, :lat, :lng)
  end
end 