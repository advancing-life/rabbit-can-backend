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
  data = JSON.parse(request.body.read)
  mail = data['mail']
  password = data['password']
  user = UserContents.create_user(mail, password)
  unless user
    {
      id: 202,
      title: "UserContents-error",
      content: "failed"
    }.to_json
  end
  user.to_json
end

post '/sign_in' do
  #begin
  sign_in_data = JSON.parse(request.body.read)
  in_mail = sign_in_data['mail']
  in_pass = sign_in_data['password']
  #-----------------------------------------
  puts "[sign in mail] => #{in_mail}"
  puts "[sign in password] => #{in_pass}"
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
  article.to_jsn
end
