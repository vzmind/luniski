class CasesController < ApplicationController
  def index
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Case")

    @cases = Case.find_all_by_OwnerId(session[:user_id])

  end

  def create
  end

  def show
  end

end
