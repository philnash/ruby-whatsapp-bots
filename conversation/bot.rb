require "sinatra/base"

class ConversationBot < Sinatra::Base
  enable :sessions
  # This will ensure that webhook requests definitely come from Twilio.
  use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'

  # When we receive a POST request to the /bot endpoint this code will run.
  post '/bot' do
    incoming = params[:Body]
    if incoming == "clear"
      session[:a] = nil
    elsif session[:a] == '1'
      if session[:b]
        message = "I learned that you prefer #{session[:b] == '1' ? 'fruit cake' : 'sponge cake'}."
        session.clear
      elsif incoming == '1'
        session[:b] = incoming
        message = "Fruit cake is a great choice!"
      elsif incoming == '2'
        session[:b] = incoming
        message = "Sponge is absolutely classic."
      else
        message = "I wanted to know whether you preferred fruit cake or sponge cake? Message 1 for fruit or 2 for sponge."
      end
    elsif session[:a] == '2'
      if session[:b]
        message = "I learned that you prefer #{session[:b] == '1' ? 'fruit pie' : 'chocolate pie'}."
        session.clear
      elsif incoming == '1'
        message = "Fruit pie is a wonderful choice!"
      elsif incoming == '2'
        message = "Chocolate is just too good."
      else
        message = "I wanted to know whether you preferred fruit pie or chocolate pie? Message 1 for fruit or 2 for chocolate."
      end
    elsif incoming == '1'
      session[:a] = incoming
      message = "Cake fan, eh? Ok, do you like fruit cake or sponge? Message 1 for fruit cake or 2 for sponge."
    elsif incoming == '2'
      session[:a] = incoming
      message = "Oh, you like pie? Do you prefer fruit pie or chocolate pie? Message 1 for fruit or 2 for chocolate"
    else
      message = "I'd like to find out a bit about you. First, do you like cake or pie? Message 1 for cake or 2 for pie."
    end
    # Initialise a new response object that we will build up.
    response = Twilio::TwiML::MessagingResponse.new
    # Add a message to reply with
    response.message body: message
    # TwiML is XML, so we set the Content-Type response header to text/xml
    content_type "text/xml"
    # Respond with the XML of the response object.
    response.to_xml
  end
end
