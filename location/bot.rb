require "sinatra/base"

class LocationBot < Sinatra::Base
  use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'

  post '/bot' do
    response = Twilio::TwiML::MessagingResponse.new

    if params["Latitude"] && params["Longitude"]
      dark_sky = DarkSky.new(ENV['DARK_SKY_API_KEY'])
      forecast = dark_sky.forecast(params["Latitude"], params["Longitude"])
      forecast_message = "It is currently #{forecast["currently"]["summary"].downcase} with a temperature of #{forecast["currently"]["temperature"].to_s.split(".").first}°C.\nForecast: #{forecast["hourly"]["summary"].downcase}"
      response.message body: forecast_message
    else
      response.message body: "To get a weather forecast, send your location from WhatsApp."
    end
    content_type "text/xml"
    response.to_xml
  end
end


class DarkSky
  def initialize(api_key)
    @api_key = api_key
  end

  BASE_URL = "https://api.darksky.net/forecast/"

  def forecast(lat, long)
    url_options = URI.encode_www_form({ :exclude => "minutely,daily,alerts,flags", :units => "si" })
    url = "#{BASE_URL}#{@api_key}/#{lat},#{long}?#{url_options}"
    response = HTTP.get(url)
    result = JSON.parse(response.to_s)
  end
end
