# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_following do
    user
    followed_user { user }
  end
end
