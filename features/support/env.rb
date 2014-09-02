# encoding: utf-8

require File.dirname(__FILE__) + '/../../support/ccm.rb'

require 'bundler/setup'

unless ENV['COVERAGE'] == 'no' || RUBY_ENGINE == 'rbx'
  require 'simplecov'

  SimpleCov.start do
    command_name 'Cucumber'
  end
end

require 'aruba/cucumber'
require 'pathname'
require 'tempfile'
require 'yaml'

require 'cassandra'
require 'cassandra/compression/compressors/snappy'
require 'cassandra/compression/compressors/lz4'

Before do
  @aruba_timeout_seconds = 15
end

After do |s| 
  # Tell Cucumber to quit after this scenario is done - if it failed.
  Cucumber.wants_to_quit = true if s.failed? and ENV["FAIL_FAST"] == 'Y'
end
