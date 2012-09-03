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

  describe 'followings' do
    let(:user2) { create :user }
    let(:user3) { create :user }

    before do
      user.follow(user2)
      user.follow(user3)

      user2.follow(user3)
      user3.follow(user)
    end

    it '#followed_users' do
      user.followed_users.should =~ [user2, user3]
      user2.followed_users.should =~ [user3]
      user3.followed_users.should =~ [user]
    end

    it '#followers' do
      user.followers.should =~ [user3]
      user2.followers.should =~ [user]
      user3.followers.should =~ [user, user2]
    end

    it 'unfollowing' do
      user.unfollow(user2)
      user.reload.followed_users.should =~ [user3]
      user2.reload.followers.should be_empty
    end
  end

end
