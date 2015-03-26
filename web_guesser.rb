require 'sinatra'
require 'sinatra/fix_951'
require 'sinatra/reloader'

NUMBER = rand(101)

def resulting_message(your_guess)
  if your_guess.to_i == NUMBER
    "You got it right! The SECRET NUMBER is #{NUMBER}"
  elsif your_guess.to_i > NUMBER + 5
    "Way too high!"
  elsif your_guess.to_i < NUMBER - 5
    "Way too low!"
  elsif your_guess.to_i > NUMBER
    "Too high!"
  elsif your_guess.to_i < NUMBER
    "Too low!"
  else
    "The SECRET NUMBER is #{NUMBER}"
  end
end

get '/' do
  your_guess = params["guess"]
  message = resulting_message(your_guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end

