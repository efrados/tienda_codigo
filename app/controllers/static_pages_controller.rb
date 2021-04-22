# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    @products = Product.all
  end

  def about; end
end
