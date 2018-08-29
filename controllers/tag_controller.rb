require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/transaction'
require_relative '../models/merchant'
require_relative '../models/tag'
also_reload '../models/*'

#INDEX
get '/tags' do
  @tag_list = Tag.all
  erb :"tags/index"
end

#NEW TAG
get '/tags/new' do
  erb :"tags/new"
end

#POST NEW TAG
post '/tags' do
  new_tag = Tag.new({ 'category' => params['category'] })
  new_tag.save
  redirect to '/tags'
end

#EDIT TAG
get '/tags/:id/edit' do
  @tag = Tag.find_by_id(params[:id]).first
  erb :"tags/edit"
end

#VIEW TRANSACTIONS BY TAG
get '/tags/:id/view' do
  @transaction_list = Transaction.find_by_tag(params[:id])
  erb :"tags/view"
end

#UPDATE TAG
post '/tags/:id' do
  new_tag = Tag.new(params)
  new_tag.update
  redirect to '/tags'
end

#DELETE TAG
get '/tags/:id/delete' do
  Transaction.null_tags(params[:id])
  Tag.find_by_id(params[:id]).first.delete
  redirect to '/tags'
end
