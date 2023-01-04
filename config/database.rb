# frozen_string_literal: true

# Events table schema
create_events = <<~SQL
  CREATE TABLE IF NOT EXISTS events(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    processed_at DATETIME,
    updated_at DATETIME DEFAULT (DATETIME('NOW')),
    created_at DATETIME DEFAULT (DATETIME('NOW'))
  )
SQL

# Execute the query
DB.execute create_events
