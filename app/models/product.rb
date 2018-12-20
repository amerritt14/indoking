# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  printful_id :integer
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  variants    :integer
#  synced      :integer
#  external_id :integer
#

class Product < ApplicationRecord
  has_many :product_variants
end
