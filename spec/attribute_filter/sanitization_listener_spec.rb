require 'spec_helper'

describe AttributeFilter::SanitizationListener do
  class ListenerWithNoMethod < AttributeFilter::SanitizationListener
  end

  it "exposes an 'abstract' attributes_sanitized method" do
    lambda { ListenerWithNoMethod.new(nil).attributes_sanitized({}, {}) }.should raise_error(
      AttributeFilter::SanitizationListener::SanitizationHookNotDefined
    )
  end
end

