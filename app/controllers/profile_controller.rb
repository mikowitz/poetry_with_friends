class ProfileController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  before_filter :authenticate_user!
  
  def index
    @view_user = current_user
    load_content
    render action: 'show'
  end

  def show
    @view_user = User.where(:id => params[:id]).first
    load_content
    redirect_to root_path if @view_user == current_user
  end

  def change_name
    @success = current_user.update_attributes(name: strip_tags(params[:name]))
    render partial: '/profile/change_name', formats: [:js]
  end

  def load_content
    @prompts = @view_user.prompts.page(params[:prompt_page]).per(5)
    @poems = @view_user.poems.page(params[:poem_page]).per(5)
  end
end
