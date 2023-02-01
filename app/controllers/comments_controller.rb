class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, text: params[:text])
    if @comment.save
      @comment.update_comments_counter
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = 'There is an error'
      redirect_back(fallback_location: root_path)
    end
  end
end
