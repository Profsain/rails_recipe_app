class ChangeColumnTypeRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :quantity
  end
end
