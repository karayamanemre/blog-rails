class PostsController < ApplicationController
  def index;
    @user = User.find(params[:id])
    @user_posts = @user.posts
    @comments = Comment.all
  end

  def show; 
    @post = Post.find(params[:id])
  end
end
