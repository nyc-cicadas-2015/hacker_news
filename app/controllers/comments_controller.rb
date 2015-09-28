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


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
