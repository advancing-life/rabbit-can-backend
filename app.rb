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

helpers do
  def uc
    UserContents.new
  end
end

get '/' do
end

post '/test' do
end

post '/sign_up' do
  sign_up_data = JSON.parse(request.body.read)
  up_mail = sign_up_data['mail']
  up_pass = sign_up_data['password']
  up_name = sign_up_data['username']

  result = uc.new_create_user(up_mail, up_pass, up_name)

  unless result.errors.messages.empty?
    body (result.errors.to_json)
    status 409
  else
    user_data= {
      id: result.u_id,
      mail: result.mail,
      name: result.name,
    }
    body(user_data.to_json)
    status 201
  end
end

post '/sign_in' do
  #begin
  sign_in_data = JSON.parse(request.body.read)
  puts sign_in_data
  in_mail = sign_in_data['mail']
  in_pass = sign_in_data['password']
  #-----------------------------------------
  puts "[sign in mail] => #{in_mail}"
  puts "[sign in password] => #{in_pass}"
  #-----------------------------------------
  result = uc.oauth_user(in_mail, in_pass)
  result.to_jsok
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
