class QueryProductMailer < ApplicationMailer

  def new_query_email
    @query_product = params[:query_product]
    @product = params[:product]
    mail(to: @query_product.email, subject: "We received a new query about #{@product.product_name}")
  end
end
