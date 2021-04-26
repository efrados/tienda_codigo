# frozen_string_literal: true

class ProductsController < ApplicationController
  include Pagy::Backend

  def show
    @product = Product.find(params[:id])
    @query_product = @product.query_products.build
  end

  def index
    @search_name = index_search_params
    @sort = sort_column
    @direction = sort_direction(false)
    @pagy, @products = pagy(Product.search(@search_name, @sort, @direction).order(updated_at: :desc), items: 10)
  end

  def favorites
    @pagy, @products = pagy(current_user.products, items: 10)
  end

  private

    def sort_column
      columns = Product.column_names
      columns.include?(params[:sort]) ? params[:sort] : 'updated_at'
    end

    def sort_direction(bool)
      %w(asc desc).include?(params[:direction]) ? params[:direction] : bool ? 'asc' : 'desc'
    end

    def index_search_params
        search = params[:search] || {}
        OpenStruct.new(
          search_name: search[:search_name],
        )
    end
end
