# frozen_string_literal: true

module Sync
  class VariantFiles < PrintfulBase
    attr_accessor :files, :product_variant_id

    def perform
      files.each do |file|
        create_file(file)
      end
    end

    private

    def create_file(file)
      variant_file = VariantFile.find_or_initialize_by(printful_id: file["id"])
      variant_file.update(variant_file_params(file))
    end

    def variant_file_params(file) # rubocop:disable Metrics/MethodLength
      {
        product_variant_id: product_variant_id,
        printful_type: file["type"],
        printful_hash: file["hash"],
        url: file["url"],
        filename: file["filename"],
        mime_type: file["mime_type"],
        size: file["size"],
        width: file["width"],
        height: file["height"],
        dpi: file["dpi"],
        status: file["status"],
        created: file["created"],
        thumbnail_url: file["thumbnail_url"],
        preview_url: file["preview_url"],
        visible: file["visible"]
      }
    end
  end
end
