require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/transaction'
require_relative '../models/merchant'
require_relative '../models/tag'
also_reload '../models/*'

#SUMMARY
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

#DELETE TAG - NEEDS REFACTORED, DELETES ENTIRE TRANSACTION
get '/tags/:id/delete' do
  # Tag.find_by_id(params[:id]).first.delete
  # redirect to '/tags'
end
