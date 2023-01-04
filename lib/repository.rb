# frozen_string_literal: true

require 'debug'
require 'sqlite3'

module Lib
  # Repository class to handle the database.
  class Repository
    def initialize
      @db = DB
      @db.results_as_hash = true
    end

    def exists?(id)
      !@db.execute('SELECT * FROM events WHERE id = ?', [id]).empty?
    end

    def all
      @db.execute('SELECT * FROM events').map { |row| Event.new(**row) }
    end

    def count
      @db.execute('SELECT COUNT(*) FROM events')[0]['COUNT(*)']
    end

    def delete(id)
      @db.execute('DELETE FROM events WHERE id = ?', [id])
    end

    def insert(title:, processed_at: 'NULL')
      query = <<-SQL
        INSERT INTO events(title, processed_at)
        VALUES("#{title}", "#{processed_at}")
        RETURNING id;
      SQL

      @db.execute(query)
    end
  end
end
