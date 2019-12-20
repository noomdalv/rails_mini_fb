class CommentsController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment successfully created'
      redirect_to @post
    else
      flash.now[:error] = 'Oops something went wrong!'
      render 'new'
    end
  end

  def index
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
