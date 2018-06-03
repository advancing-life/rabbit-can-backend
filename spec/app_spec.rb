# frozen_string_literal: true

require 'spec_helper'
require 'pry'
require File.join(File.dirname(__FILE__), '..', 'models.rb')


describe 'Sinatra' do

  context 'GET to /' do
    let(:response) { get '/' }
    it 'The API needs to response 200' do expect(response.status).to eq 200 end
  end

  context 'POST to /sign_up' do
    # POST Data
    data = "{'mail': 'hoge@sample.com', 'password': 'hogehoge'}"
    header = {'Content-Type' => 'application/json'}
    let(:response) {post '/sign_up' , data.to_json, header}

    it 'The signup needs to response' do expect(response.status).to eq 201 end
    it 'Create an account' do expect(response.body) end

  end
end
