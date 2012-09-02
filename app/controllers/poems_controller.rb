class PoemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_prompt

  def index
    @poems = Poem.order('created_at DESC')
  end

  def show
    @poem = Poem.where(id: params[:id]).first
  end

  def new
    @poem = @prompt.poems.new(params[:poem])
  end

  def create
    @poem = @prompt.poems.new(params[:poem])
    @poem.prompt = @prompt
    @poem.user = current_user
    if @poem.save
      redirect_to poem_path(@poem)
    else
      render :new
    end
  end

  def edit
    @poem = Poem.where(id: params[:id]).first()
  end

  def update
    @poem = Poem.find_by_id(params[:id])
    if @poem.update_attributes(params[:poem])
      redirect_to poem_path(@poem)
    else
      render :new
    end
  end

  private

  def get_prompt
    @prompt = Prompt.find_by_id(params[:prompt_id])
  end
end
