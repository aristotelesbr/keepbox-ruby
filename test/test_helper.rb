# frozen_string_literal: true

APP_ENV = 'test'

require File.expand_path('../config/boot', __dir__)

require 'minitest/autorun'
require 'minitest/pride'

Bundler.require(:default, :test)
