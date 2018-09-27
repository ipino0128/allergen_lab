class RecipesController < ApplicationController

  def index

    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    @recipes = Recipe.all
    @selected_recipes = []
    @recipes.each do |recipe|
      if recipe.ingredients.length == params[:q].to_i
        @selected_recipes << recipe
      end
    end
    @selected_recipes
    render :'recipes/search'
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :user_id)
    end

end
