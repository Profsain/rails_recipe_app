# frozen_string_literal: true

class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.string :quantity

      t.timestamps
    end
  end
end
