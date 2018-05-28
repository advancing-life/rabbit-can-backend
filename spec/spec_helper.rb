# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end
#
#   config.mock_with :rspec do |mocks|
#     mocks.verify_partial_doubles = true
#   end
#   config.shared_context_metadata_behavior = :apply_to_host_groups
#   if config.files_to_run.one?
#     config.default_formatter = "doc"
#   end
#   config.profile_examples = 10
#   config.order = :random
#   Kernel.srand config.seed
# end
#
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
