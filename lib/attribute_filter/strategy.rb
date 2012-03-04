module AttributeFilter
  class Strategy
    class SanitizeNotDefined < Exception; end;

    def sanitize!(attributes)
      raise SanitizeNotDefined, 
        "sanitize! method must be implmented for #{self.class.name}"
    end
  end
end

