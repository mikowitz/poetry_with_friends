require 'spec_helper'

describe ProfileController do
  let(:me) { create :user }
  let(:other) { create :user }

  before :each do
    sign_in me
  end

  describe "GET 'index'" do
    it 'redirects to my home page' do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    describe "for myself" do
      it 'redirects to my home page' do
        get 'show', id: me.id
        response.should redirect_to root_path
      end
    end
    describe 'for another user' do
      it 'returns http success' do
        get 'show', id: other.id
        response.should be_success
      end
    end
  end
end
