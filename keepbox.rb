#!/usr/bin/env ruby
# frozen_string_literal: true

require File.expand_path('./config/boot', __dir__)

# Verify if the "-d" flag was passed
if ARGV.include?('-d')
  index = ARGV.index('-d')

  directory = ARGV[index + 1]
end

Thread.new { Lib::Observer.execute(directory) }

loop do
  Lib::SyncFile.new.call

  sleep(20)
end
