RSpec::Matchers.define :belong_to do |expected|
  match do |actual|
    actual.belongs_to?(expected) == true
  end

  failure_message_for_should do |actual|
    "#{actual} should be for a poem by #{expected.display_name}"
  end

  failure_message_for_should_not do |actual|
    "#{actual} should not be for a poem by #{expected.display_name}"
  end
end
