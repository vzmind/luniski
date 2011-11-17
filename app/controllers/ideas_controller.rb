class IdeasController < ApplicationController
  

  def index
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Idea")

    @ideas = Idea.find_all_by_OwnerId(session[:user_id])

  end

  def show
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Idea")

    @idea = Idea.find(params[:id])
    
  end

end
