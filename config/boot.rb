# frozen_string_literal: true

unless RUBY_VERSION >= '3.1.0'
  raise StandardError, 'Wrong Ruby version, please use a version >= 3.1'
end

require 'debug'
require 'listen'
require 'sqlite3'

ROOT_PATH = File.expand_path('../', __dir__)

File.expand_path('../lib', __dir__).tap do |lib_path|
  Dir[
    "#{lib_path}/utils/*.rb",
    "#{lib_path}/*.rb",
    "#{lib_path}/**/*.rb"
  ].then { |files| files.each(&method(:require)) }
end

# Load the environment
if APP_ENV == 'test'
  require File.expand_path('../config/dev_enviroment', __dir__)
else
  require File.expand_path('../config/prod_enviroment', __dir__)
end