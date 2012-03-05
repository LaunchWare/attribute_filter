require 'spec_helper'

describe AttributeFilter::Filter do
  describe "without a strategy" do
    class NoStrategyFilter < AttributeFilter::Filter
    end

    it "raises an exception when attempting to use the filter" do
      lambda do 
        NoStrategyFilter.new.sanitize({})
      end.should raise_error(AttributeFilter::StrategyNotDefined)
    end
  end

  describe "with a strategy" do
    class WhitelistStrategy
      def sanitize(attributes)
      end
    end

    class WhitelistFilter < AttributeFilter::Filter
      strategy WhitelistStrategy
    end 

    it "sanitizes using the strategy class" do
      strategy_instance = mock
      strategy_instance.expects(:sanitize).once

      WhitelistStrategy.expects(:new).once.returns(strategy_instance)
      WhitelistFilter.new.sanitize({})
    end

  end

  describe "with a symbol" do
    class SymbolStrategyFilter < AttributeFilter::Filter
      strategy :white_list
    end

    it "sanitizes using the correlating strategy class" do
      strategy_instance = mock(sanitize: {})
      AttributeFilter::Strategies::WhiteList.expects(:new).returns(strategy_instance)
      SymbolStrategyFilter.new.sanitize({})
    end
  end

  describe "with a listener" do
    class Listener < AttributeFilter::SanitizationListener
      class_attribute :triggered
      def attributes_sanitized(new_hash, old_hash)
        self.class.triggered = true
      end

      class << self
        def triggered?
          triggered
        end
      end
    end

    class CompanyFilterStrategy < AttributeFilter::Strategy
      def sanitize(attributes)
        {
          name: attributes[:name]
        }
      end
    end

    class CompanyFilter < AttributeFilter::Filter
      strategy CompanyFilterStrategy
      listener Listener
    end

    it "triggers a listener when sanitization occurs" do
      CompanyFilter.new.sanitize({foo: "bar"})
      Listener.should be_triggered
    end

    it "does not trigger a listener when sanitization does not occur" do

    end

  end
end

