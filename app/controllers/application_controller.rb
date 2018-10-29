class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :sign_in_user

  include SessionsHelper


end
