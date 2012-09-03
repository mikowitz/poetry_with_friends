RSpec::Matchers.define :follow do |expected|
  match do |actual|
    actual.follows?(expected) == true
  end
  
  failure_message_for_should do |actual|
    "#{actual.display_name} should be following #{expected.display_name}"
  end

  failure_message_for_should_not do |actual|
    "#{actual.display_name} should be following #{expected.display_name}"
  end
end
