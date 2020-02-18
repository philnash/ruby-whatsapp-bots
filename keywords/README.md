# Keyword based WhatsApp bot

This bot responds to keywords with different actions.

If you send it "dog" it will respond with a fact about and a picture of a dog thanks to these APIs:

* [Dog CEO API](https://dog.ceo/dog-api/)
* [Dog API facts](https://kinduff.github.io/dog-api/)

If you send it "cat" it will respond with a fact about and a picture of a cat thanks to these APIs:

* [TheCatAPI](https://thecatapi.com/)
* [Cat Facts API](https://catfact.ninja/)

If you send a message that doesn't include "cat" or "dog" it will respond to say "I only know about dogs or cats, sorry!"

## Running the bot

Follow the instructions from the main [README](../README.md) to download the project, install the dependencies, set up the environment variables, and configure the WhatsApp sandbox.

From the root of the project you can run this bot with the command:

```bash
bundle exec rackup keywords/config.ru
```

Or within the `keywords` directory run:

```bash
bundle exec rackup
```