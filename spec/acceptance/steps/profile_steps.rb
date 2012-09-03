step "I view my profile" do
  visit '/profile'
end

step "I view the profile for :name" do |name|
  visit "/profile/#{User.where(name: name).first.id}"
end

step "I follow :name" do |name|
  @user.follow(get_user(name))
end

step "I should be able to follow :name" do |name|
  user = get_user(name)
  page.should have_css("a.follow[data-user-id='#{user.id}']")
end

step "I should not be able to follow :name" do |name|
  user = get_user(name)
  page.should_not have_css("a.follow[data-user-id='#{user.id}']")
end

step "I should be able to stop following :name" do |name|
  user = get_user(name)
  page.should have_css("a.unfollow[data-user-id='#{user.id}']")
end

def get_user(name)
  name == 'myself' ? @user : User.where(name: name).first
end
