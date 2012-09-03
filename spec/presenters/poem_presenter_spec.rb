require 'spec_helper'

describe PoemPresenter do
  test_presenter_for('raveneid')

  describe "belongs_to?" do
    let(:michael) { create :user }
    let(:my_presenter) { PoemPresenter.for(create :poem, user: michael) }
    let(:other_presenter) { PoemPresenter.for(create :poem) }

    it { my_presenter.should belong_to(michael) }
    it { other_presenter.should_not belong_to(michael) }
  end
end
