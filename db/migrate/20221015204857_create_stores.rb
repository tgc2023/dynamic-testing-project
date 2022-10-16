# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.integer :price, default: 0
      t.integer :category, default: 0
      t.integer :weight_volume, default: 0
      t.integer :unit_value, default: 0
      t.timestamps
    end
  end
end
