
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

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

  patch '/tasks/:task_name' do
    tasks = Task.find(params[:task_name])
    tasks.update(
      description: params[:description],
      due_date: params[:due_date]
    )
    tasks.to_json
  end

  delete '/tasks/:task_name' do
    tasks = Task.find(params[:task_name])
    tasks.destroy
    tasks.to_json
  end
end

#testing pending for all 4 methods