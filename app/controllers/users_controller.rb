# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @post = Post.new
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def index
    @users = User.all
  end
end
