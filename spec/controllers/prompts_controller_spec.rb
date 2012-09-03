require 'spec_helper'

describe PromptsController do
  render_views
  let(:user) { create :user }

  before(:each) do
    sign_in :user, user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      prompt = create :prompt
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
        user.reload.prompts.should include @prompt
      end
    end

    describe "with invalid params" do
      it "should reload the form" do
        post 'create', prompt: {content: ""}
        response.should be_success
      end
    end
  end

  describe "searching" do
    before do
      20.times do |i|
        create :prompt, content: "Prompt #{i + 1}x"
      end
    end

    it "returns everything when no query is passed" do
      get 'index'
      response.should be_success
      Array(1..20).each do |n|
        response.body.should =~ /Prompt #{n}x/u
      end
    end

    it "returns correct results for a search" do
      get 'index', :query => 'Prompt 1'
      response.should be_success
      Array(10..19).unshift(1).each do |n|
        response.body.should =~ /Prompt #{n}x/u
      end
      Array(2..9).unshift(20).each do |n|
        response.body.should_not =~ /Prompt #{n}x/u
      end
    end
  end
end
