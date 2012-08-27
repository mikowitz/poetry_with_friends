require 'spec_helper'

describe PoemsController do
  before do
    @user = FactoryGirl.create :user
    @prompt = FactoryGirl.create :prompt
    sign_in :user, @user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', prompt_id: @prompt.id
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "with valid params" do
      before do
        post 'create', prompt_id: @prompt.id, poem: {content: "my Poem"}
        @poem = Poem.last
      end

      it "redirect to the show page for the poem" do
        response.should redirect_to prompt_poem_path(@prompt, @poem)
      end

      it "creates a new poem for the current_user" do
        @user.reload.poems.should include @poem
      end
    end

    describe "with invalid params" do
      before do
        post 'create', prompt_id: @prompt.id, poem: {content: ""}
        @poem = Poem.last
      end
      
      it "should re-render the new form" do
        response.should be_success
      end
    end
  end

  describe "GET 'edit'" do
    before do
      @poem = FactoryGirl.create :poem, prompt: @prompt
    end

    it "returns http success" do
      get 'edit', prompt_id: @prompt.id, id: @poem.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    before do
      @poem = FactoryGirl.create :poem, prompt: @prompt
    end

    it "returns http success" do
      post 'update', prompt_id: @prompt.id, id: @poem.id, poem: {content: "new content"}
      response.should redirect_to prompt_poem_path(@prompt, @poem)
    end
  end

end
