require 'sinatra'
require 'sinatra/fix_951'
require 'sinatra/reloader'

@@number = rand(101)
@@counter = 5

def guess_limiter(your_guess)
  if @@counter == 0
    @@counter = 5
    @@number = rand(101)
    "Nope, you're out of guesses and you've lost. A new number has been generated."
  else
    @@counter -= 1
    resulting_guess(your_guess)
  end
end

def resulting_guess(your_guess)
  if your_guess.to_i == @@number
    "You got it right with #{@@counter} guesses left! The SECRET NUMBER is #{@@number}"
  elsif your_guess.to_i > @@number + 5
    "Way too high! You have #{@@counter} guesses left."
  elsif your_guess.to_i < @@number - 5
    "Way too low! You have #{@@counter} guesses left."
  elsif your_guess.to_i > @@number
    "Too high! You have #{@@counter} guesses left."
  else  your_guess.to_i < @@number
    "Too low! You have #{@@counter} guesses left."
  end
end

get '/' do
  your_guess = params["guess"]
  message = guess_limiter(your_guess)
  erb :index, :locals => {:number => @@number, :message => message}
end

