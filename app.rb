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

uc = UserContents.new

get '/' do
end

post '/test' do
end

post '/sign_up' do
  #begin
  sign_up_data = JSON.parse(request.body.read)
  up_mail = sign_up_data['mail']
  up_pass = sign_up_data['password']
  #-----------------------------------------
  puts "[sign up mail] => #{up_mail}"
  puts "[sing up passward] => #{up_pass}"
  #-----------------------------------------
  uc.new_create_user(up_mail, up_pass)
  #rescue
  puts "error"
  article_signup = {
    id: 202,
    title: "UserContents-error",
    content: "success"
  }
  article_signup.to_json

  #end
end

post '/sign_in' do
  #begin
  sign_in_data = JSON.parse(request.body.read)
  in_mail = sign_up_data['mail']
  in_pass = sign_up_data['password']
  #-----------------------------------------
  puts "[sign in mail] => #{in_mail}"
  puts "[sign in passward] => #{in_pass}"
  #-----------------------------------------
  uc.oauth_user(in_mail, in_pass)
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
