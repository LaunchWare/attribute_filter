module AttributeFilter
  module ActiveModel
    def initialize(attributes = {}, assignment_options = {})
      if @assignment_filter_class = assignment_options.delete(:filter)
        sanitize_attributes(attributes)
      end
      super
    end

    def sanitize_attributes(attributes, filter_class = nil)
      filter_class = filter_class || @assignment_filter_class
      if filter_class
        filter_class.new.sanitize!(attributes)
      else
        attributes
      end
    end

    protected
    def assignment_filter_class
      @assignment_filter_class
    end
  end
end

