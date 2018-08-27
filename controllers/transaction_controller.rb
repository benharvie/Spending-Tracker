require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/transaction'
require_relative '../models/merchant'
require_relative '../models/tag'
also_reload '../models/*'

#SUMMARY
get '/transactions' do
  @transaction_list = Transaction.all
  erb :"transactions/index"
end

#NEW TRANSACTION
get '/transactions/new' do
  erb :"transactions/new"
end

#POST NEW TRANSCATION
post '/transactions' do
  new_transaction = Transaction.new({ 'description' => params[:description],
                                      'amount' => params[:amount],
                                      'transaction_date' => params[:transaction_date],
                                      'merchant_id' => params[:merchant],
                                      'tag_id' => params[:tag] })
  new_transaction.save
  redirect to '/transactions'
end

#EDIT TRANSACTION
get '/transactions/:id/edit' do
  @transaction = Transaction.find_by_id(params[:id]).first
  erb :"transactions/edit"
end

#UPDATE TRANSACTION
post '/transactions/:id' do
  p params
  transaction = Transaction.new(params)
  transaction.update
  redirect to '/transactions'
end

#DELETE TRANSACTION
get '/transactions/:id/delete' do
  Transaction.find_by_id(params[:id]).first.delete
  redirect to '/transactions'
end
