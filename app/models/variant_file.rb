# frozen_string_literal: true

# == Schema Information
#
# Table name: variant_files
#
#  id                 :integer          not null, primary key
#  product_variant_id :integer
#  printful_id        :integer
#  printful_type      :string(255)
#  printful_hash      :string(255)
#  url                :string(255)
#  filename           :string(255)
#  mime_type          :string(255)
#  size               :integer
#  width              :integer
#  height             :integer
#  dpi                :integer
#  status             :string(255)
#  created            :integer
#  thumbnail_url      :string(255)
#  preview_url        :string(255)
#  visible            :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class VariantFile < ApplicationRecord
  belongs_to :product_variant
end
