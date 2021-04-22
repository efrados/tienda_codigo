# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :query_products
end
