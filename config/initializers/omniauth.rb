require 'forcedotcom'

# Set the default hostname for omniauth to send callbacks to.
# seems to be a bug in omniauth that it drops the httpS
# this still exists in 0.2.0

# note: you will have to change this url to your Heroku app url when you deploy it to Heroku.
OmniAuth.config.full_host = 'https://localhost:3000'

module OmniAuth
  module Strategies
    #tell omniauth to load our strategy
    autoload :Forcedotcom, 'lib/forcedotcom'
  end
end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :forcedotcom, '3MVG9PhR6g6B7ps6in8a_o8S1Ip1iiDMK828FkdlmF4XnBbv9Ek6CXfSjQzji5eJimP4yOWPS76bmJcZidCFP', '2041292024636461725'
end

