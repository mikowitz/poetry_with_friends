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

  describe "POST 'change_name'" do
    before do
      me.name.should be_nil
      post 'change_name', name: "Michael"
    end

    it 'is a success' do
      response.should be_success
    end

    it 'should change my name' do
      me.reload.name.should == "Michael"
    end
  end

  describe "should protect against JS injection" do
    before do
      me.name.should be_nil
      post 'change_name', name: "<script type='text/javascript>alert(\"Michael!\");</script>"
    end

    it 'is a success' do
      response.should be_success
    end

    it 'should change my name' do
      me.reload.name.should == "alert(\"Michael!\");"
    end

  end
end
