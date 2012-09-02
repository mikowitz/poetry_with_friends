class PoemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_poem_owner!, only: [:edit, :update]
  before_filter :get_prompt, only: [:new, :create]

  def index
  end

  def show
    @poem = Poem.where(id: params[:id]).first
  end

  def new
    @poem = current_user.poems.new(params[:poem])
  end

  def create
    @poem = current_user.poems.new(params[:poem])
    @poem.prompt = @prompt
    if @poem.save
      redirect_to poem_path(@poem)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @poem.update_attributes(params[:poem])
      redirect_to poem_path(@poem)
    else
      render :edit
    end
  end

  private

  def authenticate_poem_owner!
    @poem = current_user.poems.where(id: params[:id]).first
    redirect_to poem_path(params[:id]) unless @poem
  end

  def get_prompt
    @prompt = Prompt.where(id: params[:prompt_id]).first
  end
end
