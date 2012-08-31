step "there is a user :email" do |email|
  create :user, email: email
end

step "I am logged in as :email" do |email|
  @user = send "there is a user :email", email
  sign_in @user
end

