# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in?, only: [:show]
  before_action :set_post, only: %i[show destroy]

  def new; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post is successfully created'
      redirect_to posts_path
    else
      flash.now[:error] = 'Oops something happened!'
      render 'new'
    end
  end

  def show; end

  def index
    redirect_to new_user_session_path unless current_user
    @post = Post.new
    @posts = Post.all
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end

  private

  def logged_in?
    if current_user.nil?
      flash[:danger] = "Please login"
      redirect_to new_user_session_path
    end
  end
end
