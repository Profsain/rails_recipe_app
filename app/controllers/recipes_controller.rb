class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    @inventories = current_user.inventories.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe has been added successfully'
    else
      flash.now[:error] = 'Recipe could not be saved, try again'
      render :new
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.toggle(:public)
    recipe.save
    redirect_to recipe_path(recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Post was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Post could not be deleted'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :preparation_time, :cooking_time,
      :description, :public, current_user.id
    )
  end
end
