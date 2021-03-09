class Admin::AppRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @app_recipes = AppRecipe.all
  end
end
