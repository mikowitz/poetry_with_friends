step "there is a user :name" do |name|
  create :user, name: name, email: "#{name.downcase}@pwf.com"
end

step "I am logged in as :name" do |name|
  @user = send "there is a user :name", name
  sign_in @user
end

