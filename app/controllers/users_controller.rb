class UsersController < ApplicationController
  
  def index
    @topics = Topic.all
  end
  
  # saveはされない
  def new
    @user = User.new
  end
  
  # new + saveされる
  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end