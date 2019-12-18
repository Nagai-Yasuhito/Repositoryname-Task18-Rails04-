class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
# いいねの合計数をハートマークの横に表示してください
  def show
    @topic = Topic.find_by(id: params[:id])
    @user = @topic.user
    @favorite_count = Favorite.where(topic_id: @topic.id).count
  end
# いいねの合計数をハートマークの横に表示してください
  
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
end