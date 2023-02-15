`class InventoryFoodsController < ApplicationController
    def new
        @inventory_food = InventoryFood.new
    end

    def create
        @inventory = Inventory.find(params[:inventory_id])
        @food = Food.find(params[:food_id])
        @inventory_food = InventoryFood.new(inventory_food_params, inventory_id: @inventory.id, food_id: @food.id)
        @inventory_food.save
        redirect_to inventory_path(@inventory_food.inventory_id)
    end

    private

    def inventory_food_params
        params.require(:inventory_food).permit(:food_id, :inventory_id, :quantity)
    end
end
