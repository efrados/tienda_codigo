# frozen_string_literal: true

class QueryProductMailer < ApplicationMailer
  def new_query_email
    @query_product = params[:query_product]
    @product = params[:product]
    mail(to: @query_product.query_email, subject: "We received a new query about #{@product.product_name}")
  end

  def answer_email
    @query_product = params[:query_product]
    @product = params[:product]
    mail(to: @query_product.query_email, subject: "We received a new query about #{@product.product_name}")
  end
end
