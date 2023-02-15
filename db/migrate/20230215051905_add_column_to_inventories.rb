class AddColumnToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :description, :string
  end
end
