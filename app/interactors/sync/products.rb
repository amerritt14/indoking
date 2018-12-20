# frozen_string_literal: true

module Sync
  class Products < PrintfulBase
    def perform
      products.each do |product|
        create_product(product["id"])
      end
    end

    private

    def create_product(product_id)
      product_info = Api::Printful::Product.perform(product_id)["result"]

      product = Product.find_or_initialize_by(external_id: product_info["sync_product"]["external_id"])
      create_product_variants(product, product_info) if product.update(product_params(product_info))
    end

    def create_product_variants(product, product_info)
      sync_variants = product_info["sync_variants"]
      Sync::ProductVariants.perform(variants: sync_variants, product_id: product.id)
    end

    def products
      @products ||= Api::Printful::Products.perform["result"]
    end

    def product_params(product)
      sync_product = product["sync_product"]
      {
        external_id: sync_product["external_id"],
        name: sync_product["name"],
        printful_id: sync_product["id"],
        synced: sync_product["synced"],
        variants: sync_product["variants"]
      }.with_indifferent_access
    end
  end
end
