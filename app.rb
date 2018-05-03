require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra'
require 'sinatra/json'
require './models'
require 'open-uri'
require 'time'
require "json"
before do
	content_type :json    
	headers 'Access-Control-Allow-Origin' => '*', 
		'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
end

get '/' do
end

get '/show' do
	article = {
		id: 1,
		title: "today's dialy",
		content: "It's a sunny day."
	}

	article.to_json
end

post '/edit' do
	body = request.body.read

	if body == ''
		status 400
	else
		body.to_json
	end
end
