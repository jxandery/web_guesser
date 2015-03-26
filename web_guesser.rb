require 'sinatra'
require 'sinatra/fix_951'
require 'sinatra/reloader'

get '/' do
  number = rand(101)
  erb :index, :locals => {:number => number}
end
