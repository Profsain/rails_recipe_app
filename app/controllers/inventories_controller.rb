class InventoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @inventories = current_user.inventories.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods.includes(:inventory, :food)
    @foods = current_user.foods.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(**inventory_params, user_id: current_user.id)

    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory has been added successfully'
    else
      flash.now[:error] = 'Inventory could not be saved, try again'
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    if @inventory.destroy
      redirect_to inventories_path, notice: 'Inventory was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Inventory could not be deleted'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
