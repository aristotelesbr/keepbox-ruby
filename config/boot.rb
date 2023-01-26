# frozen_string_literal: true

if RUBY_VERSION < '3.2.0'
  raise StandardError, 'Wrong Ruby version, please use a version >= 3.2'
end

require 'async'
require 'async/semaphore'
require 'aws-sdk-s3'
require 'debug'
require 'dotenv'
require 'listen'
require 'sqlite3'

Dotenv.load

APP_ENV = ENV['APP_ENV'] || 'production'

ROOT_PATH = File.expand_path('../', __dir__)

File.expand_path('../lib', __dir__).tap do |lib_path|
  Dir[
    "#{lib_path}/utils/*.rb",
    "#{lib_path}/*.rb",
    "#{lib_path}/**/*.rb"
  ].then { |files| files.each(&method(:require)) }
end

# Load the environment
if APP_ENV == 'development' || APP_ENV == 'test'
  require File.expand_path('../config/dev_enviroment', __dir__)
else
  require File.expand_path('../config/prod_enviroment', __dir__)
end
