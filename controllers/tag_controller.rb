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

get '/tags/new' do
  erb :"tags/new"
end

post '/tags' do
  new_tag = Tag.new({ 'category' => params['category'] })
  new_tag.save
  redirect to '/tags'
end
