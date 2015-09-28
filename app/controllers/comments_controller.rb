class CommentsController < ApplicationController
  def create
    post = Post.find(params[:comment][:post_id])
    comment = post.comments.build(comment_params)
    if comment.save
      comment.update_attributes(user_id: session[:user_id])
    else
      flash[:invalid_comment] = "missing field in comment forms, try again"
    end
    redirect_to "/posts/#{post.id}"
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.update(comment_params)
    redirect_to post_path(post.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post_path(post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

