class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :database, "sqlite3:development.sqlite3"
  #login route
  post '/login' do
    user = User.find_by(username: params[:username], password: params[:password])
    if user
      redirect "/home"
    else
      pp "Login failed"
    end
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
      status: params[:status]
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