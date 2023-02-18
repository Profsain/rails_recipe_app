class RemoveColumnFromInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventory_foods, :quantity
  end
end
