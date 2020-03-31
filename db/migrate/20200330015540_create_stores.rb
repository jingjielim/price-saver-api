# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, null: false, index: { unique: true }
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
