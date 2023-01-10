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

    # Mark as processed an event.
    #
    # @param [Event] event
    # @return [Boolean] true if the event was updated.
    def mark_as_processed(event)
      query = <<-SQL
        UPDATE events
        SET processed_at = datetime('now')
        WHERE id = #{event.id};
      SQL

      @db.execute query

      true
    rescue StandardError => e
      # Log error. Failt to update event.
      puts e.message
      false
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

    # @param limit [Integer] the number of events to return.
    # @return [Array<Event>] a list of events.
    def unprocssed(limit: 10)
      @db.execute(
        'SELECT * FROM events WHERE processed_at IS NULL LIMIT ?',
        [limit]
      ).map do |row|
        Event.new(**row)
      end
    end

    def insert(title:, processed_at: 'NULL')
      query = <<-SQL
        INSERT INTO events(title, processed_at)
        VALUES("#{title}", #{processed_at})
        RETURNING id;
      SQL

      @db.execute(query)
    end
  end
end
