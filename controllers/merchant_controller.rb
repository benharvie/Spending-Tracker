require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/transaction'
require_relative '../models/merchant'
require_relative '../models/tag'
also_reload '../models/*'

#INDEX
get '/merchants' do
  @merchant_list = Merchant.all
  erb :"merchants/index"
end

#NEW MERCHANT
get '/merchants/new' do
  erb :"merchants/new"
end

#POST NEW MERCHANT
post '/merchants' do
  new_merchant = Merchant.new(params)
  new_merchant.save
  redirect to '/merchants'
end

#EDIT MERCHANT
get '/merchants/:id/edit' do
  @merchant = Merchant.find_by_id(params[:id]).first
  erb :"merchants/edit"
end

#UPDATE MERCHANT
post '/merchants/:id' do
  new_merchant = Merchant.new(params)
  new_merchant.update
  redirect to "/merchants"
end

#DELETE MERCHANT
get '/merchants/:id/delete' do
  Transaction.null_merchants(params[:id])
  Merchant.find_by_id(params[:id]).first.delete
  redirect to '/merchants'
end
