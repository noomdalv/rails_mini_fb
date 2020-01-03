# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show destroy]

  def new; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post successfully created'
    else
      flash[:danger] = 'Oops, Your post is not valid!'
    end
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @post = Post.new
    @friend_ids = current_user.friends << current_user.id
    if current_user.friends.any?
      @posts = Post.where(user_id: @friend_ids).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    else
      ids =Post.pluck(:id).shuffle[0..4]
      @posts= Post.where(id: ids).paginate(page: params[:page], per_page: 10)
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
