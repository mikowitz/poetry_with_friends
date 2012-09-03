require 'spec_helper'

describe Prompt do
  describe 'scoping' do
    let(:oldest) { create :prompt, created_at: 6.days.ago, content: "AAB" }
    let(:middle) { create :prompt, created_at: 4.days.ago, content: "AAA" }
    let(:youngest) { create :prompt, created_at: 2.days.ago, content: "BBB" }

    it "newest_first" do
      Prompt.newest_first.should == [youngest, middle, oldest]
    end

    it "that_match" do
      Prompt.that_match("A").newest_first.should == [middle, oldest]
      Prompt.that_match("B").newest_first.should == [youngest, oldest]
      Prompt.that_match(nil).newest_first.should == [youngest, middle, oldest]
    end
  end
end
