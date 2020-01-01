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
    ids = (current_user.sent_friends + current_user.received_friends) << current_user.id
    @posts = Post.where(user_id: ids).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
