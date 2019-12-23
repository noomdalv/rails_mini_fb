class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    if @like.save
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_back fallback_location: root_path
  end
end
