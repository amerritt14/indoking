# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i(show edit update destroy)
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @products = Product.all
  end

  def show
  end

  def new
    authorize @product = Product.new
  end

  def edit
  end

  def create
    authorize @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    authorize @product = Product.find(params[:id])
  end

  def product_params
    params.fetch(:product, {})
  end
end
