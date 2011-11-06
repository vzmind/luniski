class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :check_sfdc, :except => [:login]
  
  def check_sfdc
    if ENV['sfdc_token'].nil?
      redirect_to "/sessions/login"
    end
  end
end
