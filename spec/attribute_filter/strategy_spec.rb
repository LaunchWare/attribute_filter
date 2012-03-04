require 'spec_helper'

describe AttributeFilter::Strategy do
  class UnimplementedSanitization < AttributeFilter::Strategy; end

  it "exposes sanitize! as an 'abstract' class" do
    lambda { UnimplementedSanitization.new.sanitize!({}) }.should raise_error(
      AttributeFilter::Strategy::SanitizeNotDefined
    )
  end
end

