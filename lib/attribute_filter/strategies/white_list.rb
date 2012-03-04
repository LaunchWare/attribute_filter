module AttributeFilter
  module Strategies
    class WhiteList < AttributeFilter::Strategy
      def initialize(options = {})
        @white_list = options[:white_list] || {}
      end

      def sanitize(attributes = {})
        white_list.inject({}) do |new_hash, white_listed_attr|
          if attributes[white_listed_attr]
            new_hash[white_listed_attr] = attributes[white_listed_attr]
          end
          new_hash
        end
      end

      protected
      def white_list
        @white_list
      end
    end
  end
end

