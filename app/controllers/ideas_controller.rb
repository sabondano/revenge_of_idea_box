class IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end
end
