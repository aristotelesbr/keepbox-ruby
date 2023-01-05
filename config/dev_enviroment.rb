# frozen_string_literal: true

# Remove the old database
database = "#{ROOT_PATH}/monitor_test.db"
FileUtils.rm_f database

# Strart the database
DB = SQLite3::Database.new database

# Load database schema
require File.expand_path('../config/database', __dir__)
