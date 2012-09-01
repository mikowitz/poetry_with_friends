step "I view my profile" do
  visit '/profile'
end

step "I view the profile for :name" do |name|
  visit "/profile/#{User.where(:name => name).first.id}"
end

step "I should see :content" do |content|
  page.should have_content(content)
end

step "I should not see :content" do |content|
  page.should_not have_content(content)
end
