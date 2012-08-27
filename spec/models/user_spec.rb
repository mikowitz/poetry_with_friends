require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create :user
    @prompt1 = FactoryGirl.create :prompt, user: @user
    @prompt2 = FactoryGirl.create :prompt, user: @user
  end

  it "should have many prompts" do
    @user.reload
    @user.prompts.should include @prompt1
    @user.prompts.should include @prompt2
  end

  it "should have many poems" do
    poem1 = FactoryGirl.create :poem, user: @user
    poem2 = FactoryGirl.create :poem, user: @user, prompt: @prompt1

    @user.reload

    @user.poems.should include poem1
    @user.poems.should include poem2

    @user.prompts.should_not include poem1.prompt
    @user.prompts.should include poem2.prompt

    @user.answered_prompts.should include poem1.prompt
    @user.answered_prompts.should include poem2.prompt
  end
end
