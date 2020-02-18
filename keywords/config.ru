require 'bundler'
Bundler.require

Envyable.load(File.join(__dir__, '..', 'config', 'env.yml'))

require_relative 'bot.rb'
run KeywordBot