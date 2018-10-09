# frozen_string_literal: true

class ChangeColumnsOnProducts < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :description
    remove_column :products, :thumbnail_url
    remove_column :products, :preview_url

    add_column :products, :variants, :integer
    add_column :products, :synced, :integer
  end

  def down
    add_column :products, :description
    add_column :products, :thumbnail_url
    add_column :products, :preview_url

    remove_column :products, :variants, :integer
    remove_column :products, :synced, :integer
  end
end
