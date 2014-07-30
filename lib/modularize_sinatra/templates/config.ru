require 'bundler'
Bundler.require
require 'active_support/all'

$: << File.dirname(__FILE__)

ENV['RACK_ENV'] ||= 'development'

require '<%= app_name %>'
run <%= module_name %>::App

