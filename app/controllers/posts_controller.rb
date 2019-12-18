class PostsController < ApplicationController
  before_action :set_post, only:[:show, :destroy]

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      flash[:success] = 'Post is successfully created'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
  end

  def index
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

end
