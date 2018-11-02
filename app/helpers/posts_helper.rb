module PostsHelper

	  def post_author(user_id)
    @post_author = User.find(user_id)
   end



end
