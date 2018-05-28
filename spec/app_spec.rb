# frozen_string_literal: true

require 'spec_helper'
require 'pry'
# require File.expand_path '../spec_helper.rb', __FILE__

describe 'Sinatra' do
  context 'GET to /' do
    let(:response) { get '/' }
    it 'The API needs to response 200' do
      expect(response.status).to eq 200
    end
  end

  context 'POST to /sign_up' do
    data = '{"mail": "sample@sample.com", "password": "hogehoge"}'
    let(:response) {post '/sign_up' , data.to_json} #, "CONTENT_TYPE" => "application/json" 
    it 'Create an account' do
      expect(response.status).to eq 200
    end
  end
end
