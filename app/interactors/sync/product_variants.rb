# frozen_string_literal: true

module Sync
  class ProductVariants < PrintfulBase
    attr_accessor :variants, :product_id

    def perform
      variants.each do |variant|
        create_product_variant(variant)
      end
    end

    private

    def create_product_variant(variant)
      product_variant = ProductVariant.find_or_initialize_by(external_id: variant["external_id"])
      product_variant.update(product_variant_params(variant))
      create_variant_files(product_variant, variant["files"])
    end

    def create_variant_files(product_variant, files)
      Sync::VariantFiles.perform(product_variant_id: product_variant.id, files: files)
    end

    def product_variant_params(variant)
      {
        product_id: product_id,
        external_id: variant["external_id"],
        sync_product_id: variant["sync_product_id"],
        name: variant["name"],
        variant_id: variant["id"],
        retail_price: variant["retail_price"],
        currency: variant["currency"]
      }
    end
  end
end
