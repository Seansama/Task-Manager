require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/activerecord/rake'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :database, "sqlite3:development.sqlite3"

  #users
  get '/users' do
    users = User.all
    users.to_json
  end

  #tasks routes
  get 'users/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  post 'users/tasks' do
    tasks = Task.create(
      task_name: params[:task_name],
      description: params[:description],
      due_date: params[:due_date],
      status: params[:status => "Complete"] || false
    )
    tasks.to_json
  end

  patch 'users/tasks/:id' do
    tasks = Task.find(params[:id])
    tasks.update(
      description: params[:description],
      due_date: params[:due_date]
    )
    tasks.to_json
  end

  delete 'users/tasks/:id' do
    tasks = Task.find(params[:task_name])
    tasks.destroy
    tasks.to_json
  end
end

#testing pending for all 4 methods