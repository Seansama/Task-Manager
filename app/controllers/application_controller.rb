require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/activerecord/rake'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :database, "sqlite3:development.sqlite3"

  enable :sessions

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

  get '/login' do
    erb :login
  end
end

#testing pending for all 4 methods