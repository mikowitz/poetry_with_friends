FactoryGirl.define do
  sequence :email do |n|
    "test_user_#{n}@poetry-with-friends.com"
  end
end

FactoryGirl.modify do
  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end
end
