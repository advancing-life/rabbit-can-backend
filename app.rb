# frozen_string_literal: true

require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'pry' if development?

require './models'
require './user'

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => %w[OPTIONS GET POST]
end

helpers do
  def uc
    UserContents.new
  end
end

get '/' do
  status 200
end

post '/test' do
end

post '/sign_up' do
  data = JSON.parse(request.body.read)
  user = uc.create_user(data['mail'], data['password'])
  unless user.errors.messages.empty?
    body (user.errors.to_json)
    status 409
  else
    body(user.to_json)
    status 201
  end
end

post '/sign_in' do
  # begin
  sign_in_data = JSON.parse(request.body.read)
  in_mail = sign_in_data['mail']
  in_pass = sign_in_data['password']
  #-----------------------------------------
  puts "[sign in mail] => #{in_mail}"
  puts "[sign in password] => #{in_pass}"
  #-----------------------------------------
  uc.oauth_user(in_mail, in_pass)
  result_sign_in.to_jsok
  # rescue
  # puts "error"
  # end
end

get '/show' do
  article = {
    id: 1,
    title: "today's dialy",
    content: "It's a sunny day."
  }
  article.to_jsn
end
