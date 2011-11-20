
class HomeController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=0'
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Case")
    @sfdc.materialize("Idea")

    @cases = Case.find_all_by_OwnerId(session[:user_id])
    @ideas = Idea.all
  end
end
