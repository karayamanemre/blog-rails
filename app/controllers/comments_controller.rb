class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(id: params[:id], author_id: current_user.id, text: params[:text])
    if @comment.save
      redirect_to '#'
    else
      flash.now[:error] = "Error creating comment: #{@comment.errors.full_messages.join(", ")}"
      render :new
    end
  end
end
