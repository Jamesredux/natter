module SessionsHelper
	# Logs in a given user
	def log_in(user)
		session[:user_id] = user.id
		sign_in user
	end

	 def sign_in user
  	remember(user)
  end

	# Remembers the user in a persistent session.
	def remember(user)
		user.remember #this creates new token
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

end


# REFACTOR THIS SHIT