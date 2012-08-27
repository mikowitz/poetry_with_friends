FactoryGirl.define do
  sequence(:email) {|n| "test_user_#{n}@poetry-with-friends.com" }

  factory :user do
    email { FactoryGirl.generate(:email) }
    password 'password'
    password_confirmation 'password'
  end
end
