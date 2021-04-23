# frozen_string_literal: true

class FavoritesController < ApplicationController

  def add
    @product = Product.find(params[:product_id])
    current_user.products << @product
    redirect_to @product
  end

  def remove
    @product = Product.find(params[:product_id])
    current_user.products.delete(@product)
    redirect_to @product
  end
end