# frozen_string_literal: true

require 'fiber_scheduler'

module Lib
  attr_reader :success, :result

  class Uploader
    def initialize
      config = Aws.config.update(
        {
          region: ENV.fetch('AWS_REGION', 'us-east-1'),
          credentials: Aws::Credentials.new(
            ENV.fetch(
              'AWS_ACCESS_KEY_ID',
              nil
            ),
            ENV.fetch('AWS_SECRET_ACCESS_KEY', nil)
          )
        }
      )

      @bucket = ENV.fetch('BUCKET', 'keepbox')
      @prefix = ENV.fetch('PREFIX', 'keepbox/')

      @result = []
      @success = false

      @aws = Aws::S3::Client.new(config)
    end

    def call(file_path)
      # Check if file exists
      return if file_path.nil?
      return unless File.exist?(file_path)

      puts "Uploading #{file_path} to S3..."

      # Upload to S3 bucket.
      @aws.put_object(
        bucket: @bucket,
        key: @prefix + file_path,
        body: File.read(file_path)
      ).map do |response|
        @result << response
      end

      return yield(@result) if block_given?

      @success = true
    end

    def success? = @success
  end
end
