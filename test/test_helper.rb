require 'kickstarter_stripe'
require 'test/unit'
require 'mocha/setup'
require 'stringio'
require 'shoulda'
require File.expand_path('../test_data', __FILE__)

# monkeypatch request methods
module KickstarterStripe
  @mock_rest_client = nil

  def self.mock_rest_client=(mock_client)
    @mock_rest_client = mock_client
  end

  def self.execute_request(opts)
    get_params = (opts[:headers] || {})[:params]
    post_params = opts[:payload]
    case opts[:method]
    when :get then @mock_rest_client.get opts[:url], get_params, post_params
    when :post then @mock_rest_client.post opts[:url], get_params, post_params
    when :delete then @mock_rest_client.delete opts[:url], get_params, post_params
    end
  end
end

class Test::Unit::TestCase
  include KickstarterStripe::TestData
  include Mocha

  setup do
    @mock = mock
    KickstarterStripe.mock_rest_client = @mock
    KickstarterStripe.api_key="foo"
  end

  teardown do
    KickstarterStripe.mock_rest_client = nil
    KickstarterStripe.api_key=nil
  end
end
