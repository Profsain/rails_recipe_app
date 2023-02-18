class InventoryFoodsController < ApplicationController
  before_action :set_inventory
  before_action :set_foods, except: %i[new edit]
  def new
    @inventory_food = InventoryFood.new
    @foods = current_user.foods.all
  end

  def create
    @foods = Food.all.where(user_id: current_user.id)
    @inventory_food = InventoryFood.new(quantity: params[:quantity], food_id: params[:food_id])
    @inventory_food.inventory = @inventory
    if @inventory_food.save
      redirect_to inventory_path(@inventory.id), notice: 'Food has been added successfully'
    else
      flash.now[:error] = 'Food could not be saved, try again'
      render :new
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    if @inventory_food.destroy
      redirect_to inventory_path(@inventory), notice: 'Food was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Food could not be deleted'
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_foods
    @foods = Food.all
  end
end
