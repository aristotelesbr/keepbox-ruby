# frozen_string_literal: true

module Lib
  # Observer class to listen to the directory.
  module Observer
    module_function

    def execute(directory)
      listener =
        Listen.to(directory) do |modified, added, removed|
          (modified + added).each do |file|
            puts "File #{file} was modified or added"

            # Insert the file in the database
            Lib::Repository.new.insert(title: file)
          end

          removed.each do |file|
            puts "File #{file} was removed"
          end
        end

      listener.start

      loop do
        sleep 10
      end
    end
  end
end
