class CreateVariantFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :variant_files do |t|
      t.integer :product_varient_id
      t.integer :printful_id
      t.string :type
      t.string :hash
      t.string :url
      t.string :filename
      t.string :mime_type
      t.integer :size
      t.integer :width
      t.integer :height
      t.integer :dpi
      t.string :status
      t.integer :created
      t.string :thumbnail_url
      t.string :preview_url
      t.boolean :visible

      t.timestamps
    end
  end
end
