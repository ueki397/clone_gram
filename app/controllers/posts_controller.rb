class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    #newもbuildもインスタンスを作成するメソッド。違いはない。
    #ただRailsの慣習でモデルを関連付け（今回で言うと、PostモデルとPhotoモデルの関連付け）したときにbuildを使います。
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] ="投稿が保存されました。"
    else
      redirect_to root_path
      flash[:notice] = "投稿に失敗しました。"
    end
  end

private
  def post_params
    params.require(:post).permit(:caption, photos_attributes:[:image]).merge(user_id: current_user.id)
  end

end
