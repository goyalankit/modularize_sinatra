require 'bundler'
Bundler.require :default, :test

ENV['RACK_ENV'] ||= 'test'
require 'sinatra/contrib'

spec_root = File.expand_path(File.dirname(__FILE__))
$: << spec_root
$: << File.expand_path(File.join(File.dirname(__FILE__), '..'))

Sinatra::Base.set :environment, :test
require File.join(File.dirname(__FILE__), '..', '<%= app_name %>')
Dir[File.join(spec_root, "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.include Sinatra::TestHelpers
end

