# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post, only: [:create, :unlike]

  def create
    @post.likes.where(user_id: current_user.id).first_or_create
    redirect_back(fallback_location: root_path)
  end

  def unlike
    @post.likes.where(user_id: current_user.id).destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
