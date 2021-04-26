# frozen_string_literal: true

class FavoritesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @product.add_user_favorite(current_user)
    redirect_to @product
  end

  def destroy
    @product = Favorite.find(params[:id]).product
    @product.remove_user_favorite(current_user)
    redirect_to @product
  end
end