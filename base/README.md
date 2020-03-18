# Base WhatsApp bot

This bot is a base bot setup with Sinatra ready to receive incoming webhooks from Twilio and validate them, and a `config.ru` file to run the Sinatra app.

By default it replies to any incoming messages with a message that says "This is the base bot. Edit me to make your own bot."

## Running the bot

Follow the instructions from the main [README](../README.md) to download the project, install the dependencies, set up the environment variables, and configure the WhatsApp sandbox.

From the root of the project you can run this bot with the command:

```bash
bundle exec rackup base/config.ru
```

Or within the `base` directory run:

```bash
bundle exec rackup
```