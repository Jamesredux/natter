class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :sign_in_user

  include SessionsHelper


  private

  def logged_in_user
   unless logged_in?
#      store_location
     flash[:danger] = "Please log in."
     redirect_to login_url
   end
  end

  def admin_user

   unless user_admin?
     flash[:danger] = "Sorry guests can not make new posts"
    redirect_to root_url
   end 
  end

  def user_admin?
    current_user.admin?
  end

end
