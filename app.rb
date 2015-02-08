require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/task")
require("pg")


get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/tasks') do
  doctors = params.fetch('doctors')
  symptom = params.fetch('symptom')
  price_oop = params.fetch('price_oop').to_i
  percent = params.fetch('percent').to_i
  experience = params.fetch('experience').to_i
  service = params.fetch('service')
  comment = params.fetch('comment')
  @task = Task.new({:doctor => doctors, :symptom => symptom,
    :service => service, :price_oop => price_oop, :percentage_covered => percent,
    :experience => experience, :comment => comment, :done => false})
  @task.save()
  redirect back
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i)
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all
  erb(:index)
end
