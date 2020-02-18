# WhatsApp Bots built in Ruby

This is a repo of WhatsApp bots built in Ruby using the [Twilio API for WhatsApp](https://www.twilio.com/docs/sms/whatsapp/api).

## Available bots

There is one bot so far:

* [Keyword bot](keywords/README.md): a Sinatra application that can return facts and pictures about dogs and cats based on the keywords you send to it

## How to build a bot

See the blog post [Build a WhatsApp chatbot with Ruby, Sinatra and Twilio](https://www.twilio.com/blog/whatsapp-chatbot-ruby-sinatra-twilio) to see how to get started with building bots.

## Running the bots

You will need the following to run the bots in this repo:

* [Ruby](https://www.ruby-lang.org/en/downloads/) and [Bundler](https://bundler.io/) installed
* [ngrok](https://ngrok.com/) so we can [expose our local webhook endpoints to the world in style](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
* A [WhatsApp account](https://www.whatsapp.com/)
* A Twilio account (if you don't have one, [sign up for a new Twilio account here and receive $10 credit when you upgrade](https://twil.io/philnash))

### Configure the Twilio sandbox for WhatsApp

* Head to the [_WhatsApp sandbox_ area of the Twilio console](https://www.twilio.com/console/sms/whatsapp/learn), or navigate from [the console](https://www.twilio.com/console/) to [_Programmable SMS_](https://www.twilio.com/console/sms) and then [WhatsApp](https://www.twilio.com/console/sms/whatsapp/learn)
* The page will have the WhatsApp sandbox number on it. Open your WhatsApp application and start a new message to that number
* The page also has the message you need to send, which is "join" plus two random words, like "join flagrant-pigeon". Send your message to the sandbox number

### Running an application

#### Download or clone the app

Clone the application to your machine with the following command:

```bash
git clone https://github.com/philnash/ruby-whatsapp-bots.git
cd ruby-whatsapp-bots
```

#### Install dependencies

Install the dependencies with bundler:

```bash
bundle install
```

#### Configure the environment

Copy the config example file:

```bash
cp config/env.yml.example config/env.yml
```

Get your Twilio auth token from your [Twilio console](https://www.twilio.com/console/) and add it to `config/env.yml`.

#### Run the app

Change into the directory of the bot you want to run. Then run the application with:

```bash
bundle exec rackup
```

#### ngrok

Run ngrok to tunnel through to localhost:9292:

```bash
ngrok http 9292
```

Take your ngrok URL and the path to your bot, `https://YOUR_NGROK_SUBDOMAIN.ngrok.io/bot` and enter it in the [WhatsApp sandbox admin](https://www.twilio.com/console/sms/whatsapp/sandbox) in the input marked "When a message comes in" and save the configuration.

Now _send your bot a message_ and wait for the response.

## License

These bots are licensed under the [MIT license](./LICENSE).