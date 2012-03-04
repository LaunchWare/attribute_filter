require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_model/mass_assignment_security"
require "attribute_filter/version"
require "attribute_filter/filter"
require "attribute_filter/active_model"

module AttributeFilter
  class StrategyNotDefined < Exception; end
end

