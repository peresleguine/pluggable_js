require 'bundler'
require 'coffee_script'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'rspec/expectations'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../../test/dummy/config/environment.rb",  __FILE__)
ENV["RAILS_ROOT"] ||= File.dirname(__FILE__) + "../../../test/dummy"
require 'cucumber/rails'

require 'capybara-webkit'
Capybara.javascript_driver = :webkit
