class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    post = user.posts.build(post_params)
    if post.save
      binding.pry
      redirect_to '/'
    else
      flash[:error] = "post did not save, please try again."
      redirect_to '/posts/new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:url, :title)
  end

end

