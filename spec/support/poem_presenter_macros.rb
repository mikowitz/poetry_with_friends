module PoemPresenterMacros
  def test_presenter_for(filename)
    poem_input = File.read(Rails.root.join("spec/fixtures/plain_text_poems/#{filename}.txt"))
    poem_output = File.read(Rails.root.join("spec/fixtures/presented_poems/#{filename}.html")).gsub(/\n/, "")
    describe "#{filename}" do
      let(:poem) { create :poem, content: poem_input }
      subject(:presenter) { PoemPresenter.for(poem) }

      it { presenter.poem.gsub(/\n/, "").should == poem_output }
    end
  end
end
