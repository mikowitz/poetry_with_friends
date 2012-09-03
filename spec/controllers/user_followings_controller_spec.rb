require 'spec_helper'

describe UserFollowingsController do
  let(:michael) { create :user, name: 'Michael' }
  let(:jeffrey) { create :user, name: 'Jeffrey' }

  before :each do
    sign_in michael
  end

  describe "start following a user" do
    before do
      post 'toggle', followed_user_id: jeffrey.id
    end
    it "returns http success" do
      response.should be_success
    end
    it { michael.should follow(jeffrey) }
  end

  describe "stop following a user" do
    before do
      michael.follow(jeffrey)
      michael.should follow(jeffrey)
      post 'toggle', followed_user_id: jeffrey.id
    end
    it "returns http success" do
      response.should be_success
    end
    it { michael.should_not follow(jeffrey) }
  end

end
