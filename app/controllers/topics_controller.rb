class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :destroy]

  def home
    @topics = Topic.all
  end

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
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
    params.require(:topic).permit(:title, :content)
  end
end 