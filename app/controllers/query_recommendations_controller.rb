# frozen_string_literal: true

class QueryRecommendationsController < ApplicationController
  load_and_authorize_resource except: :create

  def create
    @query_product = QueryProduct.find(params[:query_product_id])
    recommendation = @query_product.query_recommendations.build(user: current_user)

    authorize! :create, recommendation
    recommendation.save

    @query_product.recommended_points = @query_product.recommended_points + 1
    @query_product.save

    render turbo_stream: turbo_stream.replace(@query_product,
                                              partial: 'remove',
                                              locals: { query_product: @query_product, btn: 'small' })
  end

  def destroy
    recommendation = QueryRecommendation.find(params[:id])
    @query_product = QueryRecommendation.find(params[:id]).query_product
    current_user.query_recommendations.delete(recommendation)

    @query_product.recommended_points = @query_product.recommended_points - 1
    @query_product.save

    render turbo_stream: turbo_stream.replace(@query_product,
                                              partial: 'add',
                                              locals: { query_product: @query_product, btn: 'small' })
  end
end
