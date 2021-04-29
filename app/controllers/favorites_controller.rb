# frozen_string_literal: true

class FavoritesController < ApplicationController
  load_and_authorize_resource except: :create

  def create
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.build(user: current_user)
    authorize! :create, favorite

    @product.add_user_favorite(current_user)
    render turbo_stream: turbo_stream.replace(@product,
                                              partial: 'remove',
                                              locals: { product: @product, btn: 'small' })
  end

  def destroy
    @product = Favorite.find(params[:id]).product
    @product.remove_user_favorite(current_user)
    render turbo_stream: turbo_stream.replace(@product,
                                              partial: 'add',
                                              locals: { product: @product, btn: 'small' })
  end
end
