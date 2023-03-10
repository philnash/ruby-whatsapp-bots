require "sinatra/base"

class KeywordBot < Sinatra::Base
  # This will ensure that webhook requests definitely come from Twilio.
  use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'

  # When we receive a POST request to the /bot endpoint this code will run.
  post '/bot' do
    # Get the message body and turn it to lowercase.
    body = params["Body"].downcase
    # Initialise a new response object that we will build up.
    response = Twilio::TwiML::MessagingResponse.new
    # We are responding with a message
    response.message do |message|
      # If the body of the incoming message includes "dog" we will add a dog
      # fact and a dog picture to the message.
      if body.include?("dog")
        message.body(Dog.fact)
        message.media(Dog.picture)
      end
      # If the body of the incoming message includes "cat" we will add a cat
      # fact and a cat picture to the message.
      if body.include?("cat")
        message.body(Cat.fact)
        message.media(Cat.picture)
      end
      # If the body of the incoming message doesn't include "cat" or "dog" then
      # send a message back to say that's what this bot knows about.
      if !(body.include?("dog") || body.include?("cat"))
        message.body("I only know about dogs or cats, sorry!")
      end
    end
    # TwiML is XML, so we set the Content-Type response header to text/xml
    content_type "text/xml"
    # Respond with the XML of the response object.
    response.to_xml
  end
end

module Cat
  # Get a random fact about cats thanks to https://catfact.ninja/.
  #
  # API URL: https://catfact.ninja/fact
  # Example API response:
  # {
  #   "fact": "Cats with long, lean bodies are more likely to be outgoing, and more protective and vocal than those with a stocky build.",
  #   "length": 121
  # }
  def self.fact
    response = HTTP.get("https://catfact.ninja/fact")
    JSON.parse(response.to_s)["fact"]
  end

  # Get a random cat picture thanks to https://thecatapi.com/.
  #
  # API URL: https://api.thecatapi.com/v1/images/search
  # Example API response:
  # [{
  #   "breeds":[],
  #   "id":"cep",
  #    "url":"https://cdn2.thecatapi.com/images/cep.jpg",
  #    "width":523,
  #    "height":700
  # }]
  def self.picture
    response = HTTP.get("https://api.thecatapi.com/v1/images/search")
    JSON.parse(response.to_s).first["url"]
  end
end

module Dog
  # Get a random fact about dogs thanks to https://dogapi.dog.
  #
  # API URL: "https://dogapi.dog/api/v2/facts"
  # Example API response:
  # {
  #   "data": [
  #     {
  #       "id": "05e0601b-c669-44d6-8308-ea9f7ce48dd6",
  #       "type": "fact",
  #       "attributes": {
  #         "body": "The average city dog lives 3 years longer than a country dog."
  #       }
  #     }
  #   ]
  # }
  def self.fact
    response = HTTP.get("https://dogapi.dog/api/v2/facts")
    JSON.parse(response.to_s)["data"].first["attributes"]["body"]
  end

  # Get a random picture of a dog thanks to https://dog.ceo/.
  #
  # API URL: https://dog.ceo/api/breeds/image/random
  # Example API response:
  # {
  #   "message": "https://images.dog.ceo/breeds/saluki/n02091831_5384.jpg",
  #   "status": "success"
  # }
  def self.picture
    response = HTTP.get("https://dog.ceo/api/breeds/image/random")
    JSON.parse(response.to_s)["message"]
  end
end
