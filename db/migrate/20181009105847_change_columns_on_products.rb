# frozen_string_literal: true

class ChangeColumnsOnProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :description
    remove_column :products, :thumbnail_url
    remove_column :products, :preview_url

    add_column :products, :variants, :integer
    add_column :products, :synced, :integer
  end
end
