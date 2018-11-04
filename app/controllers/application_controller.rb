class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :sign_in_user

  include SessionsHelper

  private

  def logged_in_user
   unless logged_in?
     flash[:danger] = "Please log in."
     redirect_to login_url
   end
  end

  def user_admin    
    unless current_user.admin?
      flash[:danger] = "ONLY ADMIN CAN DELETE POSTS."
      redirect_to root_url
    end  
  end

end
