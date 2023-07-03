class PublicRecipesController < ApplicationController
  # before_action :skip_authorization, only: :index

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(public: true)
  end
end
