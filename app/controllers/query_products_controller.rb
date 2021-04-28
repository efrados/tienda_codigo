# frozen_string_literal: true

class QueryProductsController < ApplicationController
  include Pagy::Backend

  def create
    @product = Product.find(params[:product_id])
    @query_product = @product.query_products.build(query_product_params)
    @query_product.user = current_user
    if @query_product.save
      render 'success', layout: false
    else
      render partial: 'form', layout: false
    end
  end

  def index
    @grouped_query_products = QueryProduct.with_user(current_user).montly.order(created_at: :desc).group_by(&:product)
  end

  private

  def query_product_params
    params.require(:query_product).permit(:query_text, :query_name, :query_email)
  end
end
