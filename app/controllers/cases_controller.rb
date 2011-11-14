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
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Case")
    @sfdc.materialize("CaseComment")

    @case = Case.find(params[:id])
    @comments = CaseComment.find_all_by_parentId(params[:id]) || []
    
  end

  def edit
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Case")

    @case = Case.find(params[:id])
  end

  def update
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("Case")
    
    @case = Case.find(params[:case]['Id'])
    @case.update_attributes('Description' => params[:case]['Description'],
                            'Type' => params[:case]['Type'],
                            'Status' => params[:case]['Status'],
                            'Reason' => params[:case]['Reason'],
                            'Subject' => params[:case]['Subject'])
    redirect_to cases_path
  end
end
