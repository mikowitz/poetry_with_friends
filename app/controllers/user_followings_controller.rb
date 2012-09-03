class UserFollowingsController < ApplicationController
  before_filter :authenticate_user!

  def toggle
    @followed_user = User.where(:id => params[:followed_user_id]).first
    current_user.toggle_following(@followed_user)
    render partial: '/user_followings/toggle', formats: [:js]
  end
end
