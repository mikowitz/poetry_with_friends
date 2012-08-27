class PromptsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # TODO: figure out what this page should be
    redirect_to root_path
  end

  def show
    @prompt = Prompt.find_by_id(params[:id])
  end

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.create(params[:prompt].merge(user_id: current_user.id))
    if @prompt.save
      redirect_to prompt_path(@prompt)
    else
      flash[:notice] = "Something went wrong, please try that again..."
      render :new
    end
  end
end
