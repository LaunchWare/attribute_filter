module AttributeFilter
  class Filter
    class_attribute :strategy_class
    class_attribute :listener_classes

    def sanitize(attributes)
      new_attrs = strategy.sanitize(attributes)
      if listeners.size > 0 && new_attrs != attributes
        listeners.each do |listener|
          listener.attributes_sanitized(attributes, new_attrs)
        end
      end
    end

    class << self
      def strategy(strategy_symbol_or_class)
        if strategy_symbol_or_class.is_a?(Symbol)
          self.strategy_class = strategies[strategy_symbol_or_class]
        else
          self.strategy_class = strategy_symbol_or_class
        end
      end

      def listener(listener_symbol_or_class)
        self.listener_classes ||= []
        if listener_symbol_or_class.is_a?(Symbol)
          self.listener_classes << listeners[listener_symbol_or_class]
        else
          self.listener_classes << listener_symbol_or_class
        end
      end

      protected

      def strategies
        AttributeFilter.strategies
      end

      def listeners
        AttributeFilter.listeners
      end
    end

    protected
    def listeners
      (self.class.listener_classes || []).map do |klass|
        klass.new(self)
      end
    end

    def strategy_class
      if self.class.strategy_class.nil?
        raise AttributeFilter::StrategyNotDefined, 
          "filter strategy not defined for #{self.class.name}" 
      end
      self.class.strategy_class
    end

    def strategy
      @strategy ||= self.strategy_class.new
    end
  end
end

