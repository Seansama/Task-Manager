require_relative './config/environment'
require 'active_record'

#ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']|| 'https://task-manager-production-9d27.up.railway.app/')
# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

use Rack::JSONBodyParser
run ApplicationController
