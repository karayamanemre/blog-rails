class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    if @like.save
      redirect_to '#'
    else
      flash[:error] = @like.errors.full_messages.join(", ")
      redirect_back(fallback_location: root_path)
    end
  end
end
