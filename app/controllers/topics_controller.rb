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
  
    
  def show
    @topic = Topic.includes(:user).find(params[:id])
    @user = @topic.user
    @comment  = @topic.comments.build(user_id: current_user.id) if current_user
    
        # 変数@likes_countを定義
    @favorite_count = Favorite.where(post_id: @topic.id).count

  end
  

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
