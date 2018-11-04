class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :posts]
  
  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def posts
		@user = User.find(params[:id])
		@posts = @user.posts
		render  'user_posts'
		
	end 
end
