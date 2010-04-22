class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Successfully created recipe."
      redirect_to recipes_url
    else
      render :action => 'new'
    end
  end
end
