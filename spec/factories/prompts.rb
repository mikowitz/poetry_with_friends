# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prompt do
    content "MyString"
    user
  end
end
