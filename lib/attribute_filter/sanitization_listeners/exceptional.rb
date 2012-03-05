module AttributeFilter
  module SanitizationListeners
    class Exceptional < AttributeFilter::SanitizationListener
      def attributes_sanitized(old_attributes, new_attributes)
        sanitized_keys = (old_attributes.keys - new_attributes.keys)
        raise AttributeFilter::UnexpectedSanitization,
          "#{sanitized_keys.join(",")} were unexpectedly sanitized"
      end
    end
  end
end

module AttributeFilter
  class UnexpectedSanitization < Exception; end
end

