class Admin::AppRecipesController < ApplicationController
  def index
    @app_recipes = AppRecipe.all
  end
end
