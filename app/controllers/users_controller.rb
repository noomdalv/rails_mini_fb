# frozen_string_literal: true

class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :logged_in?, only: %i[index show]
  def show; end
=======
  before_action :authenticate_user!
  def show
    @post = Post.new
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
>>>>>>> e0d4398038eee9e6272b760bd34fd446c32a84b8

  def index
    @users = User.all.paginate(page: params[:page], per_page: 5)
    @friendship = Friendship.new
  end
end
