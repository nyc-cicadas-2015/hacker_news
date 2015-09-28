class PostsController < ApplicationController
  def index
    @posts = Post.all
      respond_to do |fmt|
        fmt.html
        fmt.json { render json: @posts.to_json } ## Fun!!
      end
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

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = Post.find_by(id: params[:id])
    if post.update(post_params)
      redirect_to '/'
    else
      flash[:invalid_edit_field] = "Invalid field in the edit box, please try again"
      redirect_to edit_post_path(post)
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to '/'
  end

  private
  def post_params
    params.require(:post).permit(:url, :title)
  end

end

