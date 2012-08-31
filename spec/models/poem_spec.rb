require 'spec_helper'

describe Poem do
  let(:poem) { create :poem }
  let(:prompt1) { poem.prompt }
  let(:prompt2) { create :prompt }
  let(:poem2) { create :poem, prompt: prompt1, created_at: 3.days.ago }

  describe "for(prompt)" do
    subject(:poems) { Poem }
    it { poems.for(prompt1).should == [poem, poem2] }
    it { poems.for(prompt2).should be_empty }
  end
end
