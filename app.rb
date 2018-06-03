# frozen_string_literal: true

require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
<<<<<<< HEAD
require 'pry' if development?
=======
>>>>>>> develop

require './models'
require './user'
require './session'

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

post '/check_id' do
  check_data = JSON.parse(request.body.read)
  ch_mail = check_data['mail']
  ch_u_id = check_data['u_id']

  result = Session_oauth.new.user(ch_mail, ch_u_id)

  if result == nil || result == false 
    status 409
  else
    user_data= {
      u_id: result.u_id,
      mail: result.mail,
      name: result.name,
    }
    body(user_data.to_json)
    status 201
  end
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
      u_id: result.u_id,
      mail: result.mail,
      name: result.name,
    }
    body(user_data.to_json)
    status 201
  end
end

post '/sign_in' do
  sign_in_data = JSON.parse(request.body.read)
  in_mail = sign_in_data['mail']
  in_pass = sign_in_data['password']

  result = uc.oauth_user(in_mail, in_pass)

  if result == nil
    status 409
  elsif result == false
    status 409
  else
    user_data= {
      u_id: result.u_id,
      mail: result.mail,
      name: result.name,
    }
    body(user_data.to_json)
    status 201
  end
end

get '/show' do
  article = {
    id: 1,
    title: "today's dialy",
    content: "It's a sunny day."
  }
  article.to_jsn
end
