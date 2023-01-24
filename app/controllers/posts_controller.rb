class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @user_posts = @user.posts
    @user_posts = @user.posts.includes(:comments)
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    if params[:title].blank? || params[:text].blank?
      flash[:error] = "Title and text are required"
      redirect_back(fallback_location: root_path)
      return
    end
    @post = Post.new(Title: params[:title], Text: params[:text], author_id: current_user.id)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = 'There is an error'
      redirect_back(fallback_location: root_path)
    end
  end
end
