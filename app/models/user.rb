class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :prompts
  has_many :poems
  has_many :answered_prompts, through: :poems, source: :prompt

  has_many :user_followings
  has_many :followed_users, through: :user_followings, foreign_key: :user_id
  has_many :user_followings_for_followers, foreign_key: :followed_user_id, class_name: 'UserFollowing'
  has_many :followers, through: :user_followings_for_followers, foreign_key: :followed_user_id,
    source: :user

  def display_name
    name || email
  end

  def follow(user)
    user_followings.create(followed_user: user)
  end

  def follows?(user)
    followed_users.include? user
  end
end
