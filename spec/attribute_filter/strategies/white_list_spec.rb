require 'spec_helper'

describe AttributeFilter::Strategies::WhiteList do
  let(:white_list) { [:first_name, :last_name] }
  let(:strategy) do 
    AttributeFilter::Strategies::WhiteList.new(white_list: white_list)
  end

  describe "sanitization" do
    it "filters attributes not in the whitelist" do
      strategy.sanitize({not_in_whitelist: true}).should eql({})
    end

    it "does not filter attributes in the whitelist" do
      valid_hash = { first_name: 'dan' }
      strategy.sanitize(valid_hash).should eql(valid_hash)
    end
  end
end

