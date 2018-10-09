class CreateProductVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :product_variants do |t|
      t.integer :sync_product_id
      t.integer :printful_id
      t.integer :printful_product_id
      t.string :name
      t.integer :variant_id
      t.decimal :retail_price, precision: 6, scale: 2
      t.string :currency

      t.timestamps
    end
  end
end
