require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_model/mass_assignment_security"

require "attribute_filter/version"
require "attribute_filter/filter"
require "attribute_filter/active_model"
require "attribute_filter/strategy"
require "attribute_filter/strategies"

module AttributeFilter
  class StrategyNotDefined < Exception; end
end

