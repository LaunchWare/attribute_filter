require 'spec_helper'

describe AttributeFilter::ActiveModel do
  describe "sanitization" do
    class User
      include AttributeFilter::ActiveModel
      
      def initialize(options = {})
      end
    end

    class UserFilter < AttributeFilter::Filter
    end

    it "sanitizes using the filter" do
      mock_filter = mock
      mock_filter.expects(:sanitize).once
      UserFilter.expects(:new).returns(mock_filter)
      User.new.sanitize_attributes({}, UserFilter)
    end
  end
end

