class UserFollowingsController < ApplicationController
  before_filter :authenticate_user!

  def toggle
    followed_user = User.where(:id => params[:followed_user_id]).first
    if current_user.follows?(followed_user)
      current_user.unfollow(followed_user)
    else
      current_user.follow(followed_user)
    end
    render json: { status: 200, content: render_to_string(partial: 'shared/user_following', locals: { user: followed_user })}
  end
end
