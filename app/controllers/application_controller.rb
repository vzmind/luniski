class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_sfdc
  
  def check_sfdc
    unless params[:provider] == "forcedotcom"
      if ENV['sfdc_token'].nil?
        redirect_to "/auth/forcedotcom"
      end
    end 
  end
end
