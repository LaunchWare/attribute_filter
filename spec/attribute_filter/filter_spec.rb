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
end

