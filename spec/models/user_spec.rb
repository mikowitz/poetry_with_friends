require 'spec_helper'

describe User do
  let(:user) { create :user, email: "michael@pwf.com" }
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

  describe "display_name" do
    describe "with only email" do
      subject { user.display_name }
      it { should == "michael@pwf.com" }
    end

    describe "with a name" do
      subject { create(:user, email: "jeffrey@pwf.com", name: "Jeffrey").display_name }
      it { should == "Jeffrey" }
    end
  end

end
