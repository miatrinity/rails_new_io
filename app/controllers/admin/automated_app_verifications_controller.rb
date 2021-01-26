class Admin::AutomatedAppVerificationsController < ApplicationController
  def index
    @app_recipes = AppRecipe.all
  end
end
