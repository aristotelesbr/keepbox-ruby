# frozen_string_literal: true

# rubocop:disable Style/AsciiComments

module Lib
  class SyncFile
    # @return [Integer]
    MAX_CONCURRENCY = 5

    # Constructor receive a Repository object
    # @param repository [Lib::Repository]
    # @param uploader [Lib::Uploader]
    # @param semaphore [Async::Semaphore]
    def initialize(repository = Lib::Repository.new)
      @repository = repository
      @uploader = Lib::Uploader.new
      @semaphore = Async::Semaphore.new(MAX_CONCURRENCY)
    end

    # Process the events
    # @return [void]
    # @example
    #  sync_file.call
    # # Processing events...
    # # -----------------
    # # π: #<Lib::Event:0x00007f9b0a0b0a00 @title="file1.txt", @processed=false>
    # # -----------------
    # # -----------------
    # # π: #<Lib::Event:0x00007f9b0a0b0a00 @title="file2.txt", @processed=false>
    # # -----------------
    # # Done! ✅
    def call
      unprocsseds = @repository.unprocssed
      return if unprocsseds.empty?

      puts 'Processing events...'

      Async do
        unprocsseds.each do |event|
          @semaphore.async do
            puts "-----------------\n"
            puts "π: #{event}"
            puts '-----------------'
            # Upload the file to S3
            @uploader.call(event.title) do |result|
              # Update the event if the upload was successful
              @repository.mark_as_processed(event) if result[:success]
            end
          end
        end
      end

      puts 'Done! ✅'
    end

    private_constant :MAX_CONCURRENCY

    private

    attr_reader :repository, :uploader, :semaphore
  end
end
