class SessionsController < ApplicationController
  def create
    # Storing token
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']

    # Create connexion to SFDC based on received token
    @client = Databasedotcom::Client.new("config/databasedotcom.yml")
    @client.authenticate :token => ENV['sfdc_token'], :instance_url => ENV['sfdc_instance_url'] 

    #debug output
    redirect_to '/home'
  end

  def login

  end

end
