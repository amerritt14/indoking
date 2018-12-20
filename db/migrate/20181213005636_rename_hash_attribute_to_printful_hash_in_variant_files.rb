# frozen_string_literal: true

class RenameHashAttributeToPrintfulHashInVariantFiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :variant_files, :hash, :printful_hash
  end
end
