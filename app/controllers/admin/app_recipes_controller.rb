class Admin::AppRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @app_recipes = current_user.app_recipes.all
  end
end
