class PromptsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:query] && params[:query] == ""
      @prompts = Prompt.order('created_at DESC').page(params[:page])
    else
      @prompts = Prompt.where(Prompt.arel_table[:content].matches("%#{params[:query]}%")).
        order('created_at DESC').page(params[:page])
    end
  end

  def show
    @prompt = Prompt.where(id: params[:id]).first()
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
