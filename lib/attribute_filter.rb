require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_model/mass_assignment_security"

require "attribute_filter/version"
require "attribute_filter/filter"
require "attribute_filter/active_model"

require "attribute_filter/strategy"
require "attribute_filter/strategies"

require "attribute_filter/sanitization_listener"
require "attribute_filter/sanitization_listeners"

module AttributeFilter
  class StrategyNotDefined < Exception; end

  def self.strategies
    @strategies ||= {
      white_list: AttributeFilter::Strategies::WhiteList
      #black_list: AttributeFilter::Strategies::BlackList
    }
  end

  def self.add_strategy(sym, klass)
    strategies[sym] = klass
  end
end

