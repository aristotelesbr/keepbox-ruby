# frozen_string_literal: true

module Lib
  attr_reader :success, :result

  # Uploader class
  # @attr_reader [Hash] result
  # @attr_reader [String] prefix
  # @attr_reader [String] bucket
  # @attr_reader [Boolean] success
  class Uploader
    # @param [String] file_path
    def initialize
      @bucket = ENV.fetch('BUCKET', 'keepbox')
      @prefix = ENV.fetch('PREFIX', 'keepbox/')

      @result = {}
      @success = false

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

      @aws = Aws::S3::Client.new(config)
    end

    # Upload the file to S3
    # @param [String] file_path
    # @return [void]
    # @yield [Hash] result
    # @yieldparam [Hash] result
    # @yieldparam [Boolean] success
    # @yieldparam [Object] context
    # @yieldreturn [void]
    #
    # @example
    #  uploader.call('path/to/file') do |result|
    #   puts result[:success]
    #   puts result[:context]
    # end
    #
    # @example
    #  uploader.call('path/to/file')
    #  puts uploader.success?
    #  puts uploader.context
    #
    # @example
    #  uploader.call('path/to/file')
    #  puts uploader.result[:success]
    #  puts uploader.result[:context]
    def call(file_path)
      # Check if file exists
      return if file_path.nil?
      return unless File.exist?(file_path)

      puts "Uploading #{file_path} to S3..."

      # Upload to S3 bucket.
      begin
        @aws.put_object(
          bucket: @bucket,
          key: @prefix + file_path,
          body: File.read(file_path)
        ).map do |response|
          @success = true
          @result.merge!(response:, success: @success, context:)
        end
      rescue Aws::S3::Errors::ServiceError => e
        puts "Error uploading object: #{e.message}"
        @success = false
      end

      yield(@result) if block_given?
    end

    # @return [Boolean]
    def success? = @success

    # @return [Object]
    def context = self

    private

    # @return [Aws::S3::Client]
    attr_accessor :aws
  end
end
