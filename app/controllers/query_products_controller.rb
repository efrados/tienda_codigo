class QueryProductsController < ApplicationController
  
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

  private
    def query_product_params
      params.require(:query_product).permit(:query_text, :query_name, :query_email)
    end
end
