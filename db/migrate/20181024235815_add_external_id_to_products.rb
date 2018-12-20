# frozen_string_literal: true

class AddExternalIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :external_id, :integer
    add_column :product_variants, :external_id, :integer
  end
end
