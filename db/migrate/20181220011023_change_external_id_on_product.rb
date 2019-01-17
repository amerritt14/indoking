# frozen_string_literal: true

class ChangeExternalIdOnProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :external_id, :string
    change_column :product_variants, :external_id, :string
  end
end
