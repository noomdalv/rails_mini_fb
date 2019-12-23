class LikesController < ApplicationController
  before_action :find_post, only: [:create]
  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def destroy
  end

  private
   def find_post
     @post = Post.find(params[:post_id])
   end
end
