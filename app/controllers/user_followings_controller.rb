class UserFollowingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_followed_user

  def create
    current_user.follow(@user)
    render json: { user: { name: @user.name, id: @user.id }}
  end

  def destroy
    current_user.unfollow(@user)
    render json: { user: { name: @user.name, id: @user.id }}
  end

  def find_followed_user
    @user = User.where(id: params[:followed_user_id]).first
  end
end
