class PublicRecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(public: true)
  end
end
