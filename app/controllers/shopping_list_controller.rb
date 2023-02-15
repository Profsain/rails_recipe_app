class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.find(params[:inventory_food_id])
    @shopping_list = []
    @shopping_list << @inventory_food if @inventory_food.quantity < @recipe.quantity(@recipe)
    @total_value = 0

    @shopping_list.each do |item|
      @total_value += item.food.price * item.quantity
    end
  end
end
