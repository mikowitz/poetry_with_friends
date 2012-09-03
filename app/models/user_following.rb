class UserFollowing < ActiveRecord::Base
  attr_accessible :followed_user

  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
end
