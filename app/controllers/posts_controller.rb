class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @user_posts = @user.posts.includes(:author, :comments, :likes).all
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
      flash[:error] = 'Title and text are required'
      redirect_back(fallback_location: root_path)
      return
    end
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], author_id: current_user.id)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = 'There is an error'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end
end
