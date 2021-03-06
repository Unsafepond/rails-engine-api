ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/pride"
require "database_cleaner"
require "simplecov"

class ActiveSupport::TestCase
	DatabaseCleaner.strategy = :truncation
	SimpleCov.start("rails")
	def setup
		DatabaseCleaner.start
	end

	def teardown
		DatabaseCleaner.clean
	end
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  def json_response
  	JSON.parse(response.body)
  end
  # Add more helper methods to be used by all tests here...
end
