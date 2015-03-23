require 'sinatra'
require 'sinatra/fix_951'
require 'sinatra/reloader'

get '/' do
  num = rand(101)
  erb :index, :locals => {:num => num}
end
