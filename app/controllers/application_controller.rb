class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_user, :except => [:login,:signin]
  
  def check_user
    if session[:token].nil?
      redirect_to "/sessions/login"
    end
  end
end
