# frozen_string_literal: true

module Lib
  class SyncFile
    # Constructor receive a Repository object
    def initialize(repository = Lib::Repository.new)
      @repository = repository
      @uploader = Lib::Uploader.new
    end

    def call
      return if @repository.unprocssed.empty?

      puts 'processando...'

      @repository.unprocssed.each do |event|
        puts "-----------------\n"
        puts "π: #{event}"
        puts '-----------------'
        # Upload the file to S3
        @uploader.call(event.title)
        # Update the event if the upload was successful
        @repository.mark_as_processed(event)
      end

      puts 'Done! ✅'
    end
  end
end
