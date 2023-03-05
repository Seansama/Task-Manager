require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/activerecord/rake'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :database, "sqlite3:development.sqlite3"

  before do
    unless ['/', '/signup'].include?(request.path_info) || session[:user_id]
      redirect '/'
    end
  end

  #signup

  post '/signup' do
    users = User.create(
      username: params[:username],
      email: params[:email],
    password: params[:password]
    )
    users.to_json
  end


  # Enable sessions
  enable :sessions

  # Create a route for logging out
  get '/logout' do
    # Clear the session
    session.clear
    # Redirect to the Login page
    redirect '/login'
  end

  get '/' do
    erb :login
  end
  #login
  post '/' do
    user = User.find_by(
      username: params[:username],
      password: params[:password]
    )
    if user
      redirect "/home"
    else
      user.to_json
    end
  end


  #users
  get '/users' do
    users = User.all
    users.to_json
  end

  #tasks routes
  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  post '/tasks' do
    tasks = Task.create(
      task_name: params[:task_name],
      description: params[:description],
      due_date: params[:due_date],
      status: params[:status]
    )
    tasks.to_json
  end

  patch '/tasks/:id' do
    tasks = Task.find(params[:id])
    tasks.update(
      description: params[:description],
      due_date: params[:due_date]
    )
    tasks.to_json
  end

  delete '/tasks/:id' do
    tasks = Task.find(params[:id])
    tasks.destroy
    tasks.to_json
  end
end

#testing pending for all 4 methods