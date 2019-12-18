class PostsController < ApplicationController
  before_action :set_post, only:[:show, :destroy]
  before_action :require_user, except: [:index, :show]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      flash[:success] = 'Post is successfully created'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:body)
    end

end
