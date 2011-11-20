class SessionsController < ApplicationController
  def create
  end

  def login
    session[:token]     = nil
    session[:full_name] = nil
    session[:user_id]   = nil
  end

  def logout
    session[:token]     = nil
    session[:full_name] = nil
    session[:user_id]   = nil
    redirect_to '/sessions/login'
  end

  def signin
    client = Savon::Client.new do
      wsdl.document = File.expand_path(Rails.root + "config/wsdl.jsp-new-org.xml", __FILE__)
    end
    @response = client.request :login do
      r = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:urn='urn:enterprise.soap.sforce.com'><soapenv:Header><urn:LoginScopeHeader><urn:organizationId>00DU0000000K0FF</urn:organizationId><urn:portalId>060U0000000Trku</urn:portalId></urn:LoginScopeHeader></soapenv:Header><soapenv:Body><urn:login><urn:username>%s</urn:username><urn:password>%s</urn:password></urn:login></soapenv:Body></soapenv:Envelope>" % [params['auth']['login'],params['auth']['password']]
      soap.xml = r
    end
    @response = @response.to_hash

    session[:token]     = @response[:login_response][:result][:session_id]
    session[:full_name] = @response[:login_response][:result][:user_info][:user_full_name]
    session[:user_id]   = @response[:login_response][:result][:user_id]

    redirect_to '/home'
  end
end
