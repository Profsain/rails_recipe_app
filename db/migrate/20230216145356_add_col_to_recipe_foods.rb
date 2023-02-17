class AddColToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_foods, :quantity, :bigint
  end
end
