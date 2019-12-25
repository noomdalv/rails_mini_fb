# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    redirect_back fallback_location: root_path if @like.save
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_back fallback_location: root_path
  end
end
