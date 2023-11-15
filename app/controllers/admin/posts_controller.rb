class Admin::PostsController < ApplicationController

    #管理者ユーザー以外でアクションをしようとするとトップページに遷移する
    before_action :if_not_admin
    #管理者だけにさせたいアクションはここに記述する！
    def new
      @post = Post.new
    end
    def create
      @post = Post.new(post_params)
      if @post.valid?
        @post.save
        redirect_to root_path
      else
        render 'new'
      end
    end
  #実装していないが削除は下記を参照
  def edit
    @post = Post.find(params[:id])
  end
  def update
    tweet = Post.find(params[:id])
    if tweet.update(post_params)
        redirect_to root_path
    else
      redirect_to :action => "new"
    end
  end
  def destroy
    tweet = Post.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end
    private
    def if_not_admin
      redirect_to root_path unless current_user.admin?
    end
    def post_params
      params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
    end

end
