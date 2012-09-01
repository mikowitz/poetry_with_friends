step "I view my profile" do
  visit '/profile'
end

step "I view the profile for :name" do |name|
  visit "/profile/#{User.where(name: name).first.id}"
end

step "I follow :name" do |name|
  @user.follow(User.where(name: name).first)
end
