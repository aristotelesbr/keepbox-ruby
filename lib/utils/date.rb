# frozen_string_literal: true

module Lib
  module Utils
    # Date module.
    module Date
      module_function

      def current
        Time.now.strftime('%Y-%m-%d %H:%M:%S')
      end

      def to_d(date)
        date.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end
end
