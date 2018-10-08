# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :printful_id
      t.string :name
      t.text :description
      t.string :thumbnail_url
      t.string :preview_url

      t.timestamps
    end
  end
end
