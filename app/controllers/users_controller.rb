class UsersController < ApplicationController
  def new
  end

  def show
  	@user = current_user
  end

  def posts
	
		@user = User.find(params[:id])
		@posts = @user.posts
		render  'user_posts'
		
	end

  
end
