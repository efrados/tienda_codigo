# frozen_string_literal: true

class FavoritesController < ApplicationController

  def add
    @product = Product.find(params[:product_id])
    @product.add_user_favorite(current_user)
    redirect_to @product
  end

  def remove
    @product = Product.find(params[:product_id])
    @product.remove_user_favorite(current_user)
    redirect_to @product
  end
end