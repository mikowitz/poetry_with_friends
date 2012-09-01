class ProfileController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  before_filter :authenticate_user!
  
  def index
    @view_user = current_user
    render action: 'show'
  end

  def show
    @view_user = User.where(:id => params[:id]).first
    redirect_to root_path if @view_user == current_user
  end

  def change_name
    if current_user.update_attributes(name: strip_tags(params[:name]))
      render json: { status: 200, name: current_user.reload.name }
    else
      render json: { status: 409, nothing: true }
    end
  end
end
