class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end 
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
  def show
    @topic = Topic.find_by(topic_id: topic_id)
    @favorites_count = Favorite.where(topic_id: params[:topic_id]).count
  end
end