# frozen_string_literal: true

# Strart the database
DB = SQLite3::Database.new "#{ROOT_PATH}/monitor.db"

# Load database schema
require File.expand_path('../config/database', __dir__)
