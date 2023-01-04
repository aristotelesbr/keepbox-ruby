# frozen_string_literal: true

require './test/test_helper'

module Lib
  class RepositoryTest < Minitest::Test
    def test_insert
      # Arrange
      title = 'test/fixtures/empty.txt'
      repository = Lib::Repository.new

      # Act
      resutl = repository.insert(title:)

      # Assert
      assert resutl
    end

    def test_exists
      # Arrange
      title = 'test/fixtures/empty.txt'
      repository = Lib::Repository.new

      # Act
      result = repository.insert(title:)

      # Assert
      assert repository.exists?(result.first['id'])
    end

    def test_count
      # Arrange
      # Clear the database events table
      DB.execute('DELETE FROM events')

      title = 'test/fixtures/empty.txt'
      repository = Lib::Repository.new

      # Act
      repository.insert(title:)

      # Assert
      assert_equal 1, repository.count
    end

    def test_all
      # Arrange
      # Clear the database events table
      DB.execute('DELETE FROM events')

      title = 'test/fixtures/empty.txt'
      repository = Lib::Repository.new

      # Act
      repository.insert(title:)

      # Assert
      assert_equal 1, repository.all.length
    end

    def test_delete
      # Arrange
      # Clear the database events table
      DB.execute('DELETE FROM events')

      title = 'test/fixtures/empty.txt'
      repository = Lib::Repository.new

      # Act
      result = repository.insert(title:)
      repository.delete(result.first['id'])

      # Assert
      assert_equal 0, repository.count
    end
  end
end
