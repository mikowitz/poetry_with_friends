class PoemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_poem_owner!, only: [:edit, :update]
  before_filter :build_new_poem, only: [:new, :create]

  def index
    @poems = Poem.order('created_at DESC')
  end

  def show
    @poem = Poem.where(id: params[:id]).first
  end

  def new
  end

  def create
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

  def build_new_poem
    @prompt = Prompt.where(id: params[:prompt_id]).first
    redirect_to poems_path unless @prompt
    @poem = current_user.poems.where(prompt_id: @prompt).new(params[:poem])
  end
end
