ENV['RACK_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "production"
# Require in Gems
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# Require in all files in 'app' directory
require_all 'app'
require 'faker'