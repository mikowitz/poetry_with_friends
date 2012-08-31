step "I view my profile" do
  visit '/profile'
end

step "I view the profile for :email" do |email|
  visit "/profile/#{User.where(:email => email).first.id}"
end

step "I should see the header :header" do |header|
  within('#profile') do
    page.should have_content(header)
  end
end
