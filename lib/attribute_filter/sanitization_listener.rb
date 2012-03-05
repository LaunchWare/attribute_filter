module AttributeFilter
  class SanitizationListener
    class SanitizationHookNotDefined < Exception; end;
    def initialize(filter)
      @filter = filter
    end

    def attributes_sanitized(old_attributes, new_attributes)
      raise SanitizationHookNotDefined,
        "attributes_sanitized method must be implemented for #{self.class.name}"
    end
  end
end

