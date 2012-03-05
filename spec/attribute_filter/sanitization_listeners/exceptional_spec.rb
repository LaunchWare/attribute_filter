require 'spec_helper'

describe AttributeFilter::SanitizationListeners::Exceptional do
  it "raises an exception when it gets called" do
    lambda do
      AttributeFilter::SanitizationListeners::Exceptional.new(nil).attributes_sanitized({}, {})
    end.should raise_error(AttributeFilter::UnexpectedSanitization)
  end

  it "includes the keys that were sanitized in the exception message" do
    old_hash = {first_name: "John", last_name: "Smith"}
    begin
      AttributeFilter::SanitizationListeners::Exceptional.new(nil).attributes_sanitized(old_hash, {})
      false.should be_true, "expected exception to get raised"
    rescue AttributeFilter::UnexpectedSanitization => e
      e.message.should =~ /^#{old_hash.keys.join(",")}/
    end
  end
end

