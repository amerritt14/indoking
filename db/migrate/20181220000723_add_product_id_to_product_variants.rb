# frozen_string_literal: true

class AddProductIdToProductVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :product_variants, :product_id, :integer, index: true
    rename_column :variant_files, :product_varient_id, :product_variant_id
  end
end
