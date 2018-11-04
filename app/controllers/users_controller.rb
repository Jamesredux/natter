class UsersController < ApplicationController
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
