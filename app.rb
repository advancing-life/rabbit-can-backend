require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra'
require 'sinatra/json'
require 'open-uri'
require 'time'
require 'json'

require './models'
require './user'

before do
  content_type :json    
  headers 'Access-Control-Allow-Origin' => '*', 
    'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
end

get '/' do
end

post '/test' do
end

post '/sign_up' do
  #begin
  sign_up_data = JSON.parse(request.body.read)
  UserContents.new.new_create_user(sign_up_data['mail'],sign_up['password'])
  #rescue
  puts "error"
  result_sign_up.to_jsok
  #end
end

post '/sign_in' do
  #begin
  sign_in_data = JSON.parse(request.body.read)
  #puts sign_in_data['mail']
  #puts sign_in_data['password']
  UserContents.new.oauth_user(sign_in_data['mail'],sign_in_data['password'])
  result_sign_in.to_jsok
  #rescue
  #puts "error"
  #end
end

get '/show' do
  article = {
    id: 1,
    title: "today's dialy",
    content: "It's a sunny day."
  }
  article.to_json
end
