# frozen_string_literal: true

class StaticPagesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @products = pagy(Product.all.order(updated_at: :desc), items: 10)
  end

  def about; end
end
