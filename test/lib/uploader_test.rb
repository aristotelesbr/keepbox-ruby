# frozen_string_literal: true

require './test/test_helper'

module Lib
  class UploadTest < Minitest::Test
    def test_call
      # Arrange
      @uploader = Minitest::Mock.new

      # Act
      @uploader.expect(:call, true, ['test/fixtures'])

      # Assert
      assert @uploader.call('test/fixtures')
    end

    def test_success
      # Arrange
      @uploader = Minitest::Mock.new

      # Act
      @uploader.expect(:success?, true)

      # Assert
      assert_predicate @uploader, :success?
    end
  end
end
