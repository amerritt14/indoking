# frozen_string_literal: true

# == Schema Information
#
# Table name: product_variants
#
#  id                  :integer          not null, primary key
#  sync_product_id     :integer
#  printful_id         :integer
#  printful_product_id :integer
#  name                :string(255)
#  variant_id          :integer
#  retail_price        :decimal(6, 2)
#  currency            :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  external_id         :integer
#  product_id          :integer
#

class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :variant_files
end
