require 'bundler/setup'
require 'rack-flash'
require_relative '../app/models/concerns/slugifiable.rb'

Bundler.require(:default, ENV['SINATRA_ENV'])

require_all 'app'
