class IdeasController < ApplicationController
  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)

    redirect_to root_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
