class ShoppingListController < ApplicationController
  before_action :set_recipe
  before_action :set_inventory

  def index
    @recipe_items = []

    @recipe.recipe_foods.each do |recipe_food|
      @recipe_items << recipe_food
    end

    @inventory_items = []

    @inventory.inventory_foods.each do |inventory_food|
      @inventory_items << inventory_food
    end

    @shopping_list = []

    @recipe_items.each do |recipe_item|
      @inventory_items.each do |inventory_item|
        next unless recipe_item.food_id == inventory_item.food_id && (recipe_item.quantity < inventory_item.quantity)

        @shopping_list << recipe_item
        @items_to_buy = @shopping_list.length
        @total_value_of_food = @items_to_buy * recipe_item.food.price
      end
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end
end
