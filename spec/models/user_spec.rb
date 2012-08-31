require 'spec_helper'

describe User do
  let(:user) { create :user }
  let(:prompt1) { create :prompt, user: user }
  let(:prompt2) { create :prompt, user: user }
  let(:poem1) { create :poem, user: user }
  let(:poem2) { create :poem, user: user, prompt: prompt1 }

  describe "prompts" do
    subject { user.prompts }
    it { should =~ [prompt1, prompt2] }
    it { should_not include poem1.prompt }
    it { should include poem2.prompt }
  end

  describe "poems" do
    subject(:poems) { user.poems }

    it { should =~ [poem1, poem2] }
  end

  describe "answered prompts" do
    subject { user.answered_prompts }
    it { should =~ [poem1.prompt, poem2.prompt] }
  end
end
