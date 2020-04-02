# frozen_string_literal: true

class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.float :value, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :item, index: true, foreign_key: {message: 'hi'}, null: false
      t.references :store, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
