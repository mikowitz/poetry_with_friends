require 'spec_helper'

describe PoemsController do
  let(:user) { create :user }
  let(:prompt) { create :prompt }
  before :each do
    sign_in user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:poem) { create :poem }
    it "returns http success" do
      get 'show', id: poem.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', prompt_id: prompt.id
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "with valid params" do
      before do
        post 'create', prompt_id: prompt.id, poem: {content: "my Poem"}
        @poem = Poem.last
      end

      it "redirect to the show page for the poem" do
        response.should redirect_to poem_path(@poem)
      end

      it "creates a new poem for the current_user" do
        user.reload.poems.should include @poem
      end

      it "creates a new poem under the correct prompt" do
        prompt.reload.poems.should include @poem
      end
    end

    describe "with invalid params" do
      before do
        post 'create', prompt_id: prompt.id, poem: {content: ""}
      end
      
      it "should re-render the new form" do
        response.should be_success
        response.should render_template 'new'
      end
    end
  end

  describe 'editing poems written by the current user' do
    let(:poem) { create :poem, prompt: prompt, user: user }

    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit', prompt_id: prompt.id, id: poem.id
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      describe "with valid params" do
        before do
          put 'update', prompt_id: prompt.id, id: poem.id, poem: {content: "new content"}
        end

        it "returns http success" do
          response.should redirect_to poem_path(poem)
        end

        it "should update the poem" do
          poem.reload.content.should =~ /new content/u
        end
      end

      describe "with invalid params" do
        it "should re-render the edit form" do
          put 'update', prompt_id: prompt.id, id: poem.id, poem: {content: ""}
          response.should be_success
          response.should render_template 'edit'
        end
      end
    end
  end

  describe "trying to edit another user's poems" do
    let(:poem) { create :poem, prompt: prompt, user: create(:user), content: "original content" }

    describe "GET 'edit'" do
      it "should redirect to 'show' for the poem" do
        get 'edit', id: poem.id
        response.should redirect_to poem_path(poem)
      end
    end

    describe "PUT 'update'" do
      before do
        put 'update', id: poem.id, poem: { content: "new content" }
      end

      it "should redirect to 'show' for the poem" do
        response.should redirect_to poem_path(poem)
      end

      it "should not update the poem" do
        poem.reload.content.should =~ /original content/u
      end
    end
  end
end
