# Location based WhatsApp bot

This bot responds to a location message with a weather forecast for the location.

It uses the [Dark Sky API](https://darksky.net/dev) to fetch the weather forecast. You can get a [free API key here](https://darksky.net/dev/register) to use it.

## Build this bot yourself

You can see how to build this bot in the blog post _that is coming soon_.

## Running the bot

Follow the instructions from the main [README](../README.md) to download the project, install the dependencies, set up the environment variables, and configure the WhatsApp sandbox.

From the root of the project you can run this bot with the command:

```bash
bundle exec rackup location/config.ru
```

Or within the `location` directory run:

```bash
bundle exec rackup
```