class RecipesController < ApplicationController

  def index
    if @recipes
      render :index
    else
    @recipes = Recipe.all
  end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    @recipes = Recipe.all
    @selected_recipes = []
    @recipes.each do |recipe|
      if recipe.ingredients.length == :q
        @selected_recipes << recipe
      end
    end
      byebug
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :user_id)
    end

end
