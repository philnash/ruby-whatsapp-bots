require "sinatra/base"

class BaseBot < Sinatra::Base
  # This will ensure that webhook requests definitely come from Twilio.
  use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'

  # When we receive a POST request to the /bot endpoint this code will run.
  post '/bot' do
    # Initialise a new response object that we will build up.
    response = Twilio::TwiML::MessagingResponse.new
    # Add a message to reply with
    response.message body: "This is the base bot. Edit me to make your own bot."
    # TwiML is XML, so we set the Content-Type response header to text/xml
    content_type "text/xml"
    # Respond with the XML of the response object.
    response.to_xml
  end
end
