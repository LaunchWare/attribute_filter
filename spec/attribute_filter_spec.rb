require 'spec_helper'

describe AttributeFilter do
  it "defines a list of strategies" do
    AttributeFilter.strategies.should be_kind_of(Hash)
  end

  class FunkyStrategy < AttributeFilter::Strategy
  end

  it "can add to the list of strategies" do
    AttributeFilter.add_strategy(:funky, FunkyStrategy)
    AttributeFilter.strategies[:funky].should eql(FunkyStrategy)
  end
end

