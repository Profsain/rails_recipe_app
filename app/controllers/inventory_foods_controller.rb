class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
  end

  def create
   @inventory_food = InventoryFood.new(quantity: params[:quantity], food_id: params[:food_id])
   @inventory_food.inventory = @inventory

    if @inventory_food.save
      redirect_to inventory_path(@inventory), notice: 'Food has been added successfully'
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
end
