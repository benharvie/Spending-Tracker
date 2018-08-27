require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/transaction'
also_reload '../models/*'

#SUMMARY
get '/transactions' do
  @transaction_list = Transaction.all
  erb :"transactions/index"
end

#NEW TRANSCATION
get '/transactions/new' do
  erb :"transactions/new"
end
