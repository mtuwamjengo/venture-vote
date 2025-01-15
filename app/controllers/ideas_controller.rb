class IdeasController < ApplicationController

  def index
    @ideas = Idea.order(votes: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path, notice: 'Idea was successfully created.'
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def vote
    @idea = Idea.find(params[:id])
    vote_direction = params[:vote].to_i
    @idea.votes = (@idea.votes || 0) + vote_direction
    @idea.save
    redirect_to ideas_path, notice: "Vote recorded!"
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
