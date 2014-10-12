class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post= Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if current_user.present?
      @comment.user_id = current_user.id
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
        redirect_to post_path(@post), alert: 'Please Login'
      end
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
