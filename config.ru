require 'bundler'
Bundler.require

Envyable.load('./config/env.yml')

require './bot.rb'
run WhatsAppBot