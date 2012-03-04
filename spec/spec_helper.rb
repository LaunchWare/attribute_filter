require 'bundler/setup'

require 'attribute_filter' # and any other gems you need

RSpec.configure do |config|
  config.mock_with :mocha
end
