# frozen_string_literal: true

class RenameTypeToPrintfulTypeInVariantFiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :variant_files, :type, :printful_type
  end
end
