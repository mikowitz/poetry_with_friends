require 'spec_helper'

describe PromptsController do
  before(:each) do
    @user = FactoryGirl.create :user
    sign_in :user, @user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should redirect_to root_path
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      prompt = FactoryGirl.create :prompt
      get 'show', :id => prompt.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "with valid params" do
      before do
        post 'create', prompt: {content: "TestPrompt"}
        @prompt = Prompt.last
      end

      it "redirects to the show page for the prompt" do
        response.should redirect_to(action: 'show', id: @prompt.id)
      end

      it "creates a new prompt for the current_user" do
        @user.reload.prompts.should include @prompt
      end
    end

    describe "with invalid params" do
      it "should reload the form" do
        post 'create', prompt: {content: ""}
        response.should be_success
      end
    end
  end
end
