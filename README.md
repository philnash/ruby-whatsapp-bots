# WhatsApp Bots built in Ruby

This is a repo of WhatsApp bots built in Ruby using the [Twilio API for WhatsApp](https://www.twilio.com/docs/sms/whatsapp/api). There is one bot so far, a Sinatra application that can return facts and pictures about dogs and cats.

## Running the bot

You will need the following to run this bot:

* [Ruby](https://www.ruby-lang.org/en/downloads/) and [Bundler](https://bundler.io/) installed
* [ngrok](https://ngrok.com/) so we can [expose our local webhook endpoints to the world in style](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
* A [WhatsApp account](https://www.whatsapp.com/)
* A Twilio account (if you don't have one, [sign up for a new Twilio account here and receive $10 credit when you upgrade](https://twil.io/philnash))

### Configure the Twilio sandbox for WhatsApp

* Head to the [_WhatsApp sandbox_ area of the Twilio console](https://www.twilio.com/console/sms/whatsapp/learn), or navigate from [the console](https://www.twilio.com/console/) to [_Programmable SMS_](https://www.twilio.com/console/sms) and then [WhatsApp](https://www.twilio.com/console/sms/whatsapp/learn)
* The page will have the WhatsApp sandbox number on it. Open your WhatsApp application and start a new message to that number
* The page also has the message you need to send, which is "join" plus two random words, like "join flagrant-pigeon". Send your message to the sandbox number

### Running the application

Clone the application to your machine with the following command:

```bash
git clone https://github.com/philnash/ruby-whatsapp-bots.git
cd ruby-whatsapp-bots
```

Install the dependencies with bundler:

```bash
bundle install
```

Copy the config example file:

```bash
cp config/env.yml.example config/env.yml
```

Get your Twilio auth token from your [Twilio console](https://www.twilio.com/console/) and add it to `config/env.yml`.

Run the application with:

```bash
bundle exec rackup
```

Run ngrok to tunnel through to localhost:9292:

```bash
ngrok http 9292
```

Take your ngrok URL and the path to your bot, `https://YOUR_NGROK_SUBDOMAIN.ngrok.io/bot` and enter it in the [WhatsApp sandbox admin](https://www.twilio.com/console/sms/whatsapp/sandbox) in the input marked "When a message comes in" and save the configuration.

Now _send your bot a message_.