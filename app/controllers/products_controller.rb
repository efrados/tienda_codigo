# frozen_string_literal: true

class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @query_product = @product.query_products.build
  end

  def favorites
    @products = current_user.products
  end
end
