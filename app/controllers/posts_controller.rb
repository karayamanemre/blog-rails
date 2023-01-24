class PostsController < ApplicationController
  def index;
    @user = User.find(params[:id])
    @user_posts = @user.posts
    @user_posts = @user.posts.includes(:comments)
    @comments = Comment.all
  end

  def show; 
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
