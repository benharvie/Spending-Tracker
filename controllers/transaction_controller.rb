require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/transaction'
also_reload '../models/*'

#SUMMARY
get '/' do
  erb :index
end
