class PromptsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @prompts = Prompt.that_match(params[:query]).newest_first.page(params[:page])
  end

  def show
    @prompt = Prompt.where(id: params[:id]).first()
  end

  def new
    @prompt = current_user.prompts.new
  end

  def create
    @prompt = current_user.prompts.new(params[:prompt])
    if @prompt.save
      redirect_to prompt_path(@prompt)
    else
      flash[:notice] = "Something went wrong, please try that again..."
      render :new
    end
  end
end
