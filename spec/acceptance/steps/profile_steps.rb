step "I view my profile" do
  visit '/profile'
end

step "I view the profile for :name" do |name|
  visit "/profile/#{User.where(:name => name).first.id}"
end

step "I should see the header :header" do |header|
  within('#profile') do
    page.should have_content(header)
  end
end
