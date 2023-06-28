class RecipeFoodsController < ApplicationController
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = Recipe.first
    @recipe_food.food = Food.first

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(Recipe.first), notice: 'Ingredient was added succesfully' }
      end
    end
  end

  protected

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
