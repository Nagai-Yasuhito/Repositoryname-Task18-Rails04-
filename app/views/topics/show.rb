# いいねの合計数をハートマークの横に表示してください
def show
  @topic = Topic.find_by(id: params[:id])
  @user = @topic.user
  @favorite_count = Favorite.where(topic_id: @topic.id).count
end
# いいねの合計数をハートマークの横に表示してください