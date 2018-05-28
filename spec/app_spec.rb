# frozen_string_literal: true

require 'spec_helper'
# require File.expand_path '../spec_helper.rb', __FILE__

describe 'Sinatra' do
  it 'should allow accessing the API' do
    get '/'
    expect(last_response).to be_ok
  end
end
