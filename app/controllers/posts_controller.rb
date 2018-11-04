class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]
  before_action :user_admin, only: [:destroy]

  def new
  	@post = Post.new
  end

  def index
    @posts = Post.paginate(page: params[:page], :per_page => 5)
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
  		flash[:info] = "New post saved."
  		redirect_to root_url
  	else
  		render 'new'
  	end		
  end

  def destroy
  	Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end

  private

  def post_params
  	params.require(:post).permit(:body)
  end
  
end
