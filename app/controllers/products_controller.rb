# frozen_string_literal: true

class ProductsController < ApplicationController
  include Pagy::Backend

  def show
    @product = Product.find(params[:id])
    @query_product = @product.query_products.build
  end

  def favorites
    @pagy, @products = pagy(current_user.products, items: 10)
  end
end
