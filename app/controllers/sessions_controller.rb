class SessionsController < ApplicationController
  def create
  end

  def login
    

  end

  def signin
    client = Savon::Client.new do
      wsdl.document = File.expand_path(Rails.root + "config/wsdl.jsp-new-org-partner.xml", __FILE__)
    end
    @response = client.request :login do
      soap.header = { "LoginScopeHeader" => {"organizationId" => "00DU0000000K0FF", "portalID" => "060U0000000Trku"}}
      soap.body = {:username => params['auth']['login'], :password => params['auth']['password'] } # old app 'zMwIiBw646L4sEtfnmXw7zMs'}
    end
    debugger
    @response = @response.to_hash
    ENV['sfdc_token'] = @response[:login_response][:result][:session_id]
    @client = Databasedotcom::Client.new("config/databasedotcom.yml")
    @client.authenticate :token => ENV['sfdc_token'], :instance_url => ENV['sfdc_instance_url']
    redirect_to '/home'
  end
end
