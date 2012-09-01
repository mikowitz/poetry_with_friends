class ProfileController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @view_user = current_user
    render action: 'show'
  end

  def show
    @view_user = User.where(:id => params[:id]).first
    redirect_to root_path if @view_user == current_user
  end
end
