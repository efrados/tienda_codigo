class StaticPagesController < ApplicationController
  def index
    @products = Product.all
  end

  def about
  end
end
