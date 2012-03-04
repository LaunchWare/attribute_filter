module AttributeFilter
  class Filter
    class_attribute :strategy_class

    def sanitize(attributes)
      strategy.sanitize(attributes)
    end

    class << self
      def strategy(strategy_symbol_or_class)
        if strategy_symbol_or_class.is_a?(Symbol)
          self.strategy_class = strategies[strategy_symbol_or_class]
        else
          self.strategy_class = strategy_symbol_or_class
        end
      end

      protected

      def strategies
        AttributeFilter.strategies
      end
    end

    protected
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

