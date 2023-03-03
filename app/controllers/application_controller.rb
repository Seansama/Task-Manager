require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/activerecord/rake'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :database, "sqlite3:development.sqlite3"

  enable :sessions
  #sign up route

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :signup
    end
  end

  #login Routes
  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :login
    end
  end

  # logout route
  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  post '/tasks' do
    tasks = Task.create(
      task_name: params[:task_name],
      description: params[:description],
      due_date: params[:due_date],
      status: params[:status => "Complete"] || false
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
    tasks = Task.find(params[:task_name])
    tasks.destroy
    tasks.to_json
  end
end

#testing pending for all 4 methods