require_relative './config/environment'
require 'app/controllers/application_controller'
use Rack::JSONBodyParser

run ApplicationController