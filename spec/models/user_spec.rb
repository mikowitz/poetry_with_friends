require 'spec_helper'

describe User do
  it "should have many prompts" do
    user = FactoryGirl.create :user
    prompt1 = FactoryGirl.create :prompt, :user => user
    prompt2 = FactoryGirl.create :prompt, :user => user

    user.reload.prompts.should include prompt1
    user.reload.prompts.should include prompt2
  end
end
