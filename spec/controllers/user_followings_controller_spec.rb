require 'spec_helper'

describe UserFollowingsController do
  let(:michael) { create :user, name: 'Michael' }
  let(:jeffrey) { create :user, name: 'Jeffrey' }

  before :each do
    sign_in michael
  end

  describe "GET 'create'" do
    before do
      post 'create', followed_user_id: jeffrey.id
    end
    it "returns http success" do
      response.should be_success
    end
    it { michael.should follow(jeffrey) }
  end

  describe "GET 'destroy'" do
    before do
      michael.follow(jeffrey)
      michael.should follow(jeffrey)
      delete 'destroy', followed_user_id: jeffrey.id
    end
    it "returns http success" do
      response.should be_success
    end
    it { michael.should_not follow(jeffrey) }
  end

end
