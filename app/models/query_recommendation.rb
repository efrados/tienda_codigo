# frozen_string_literal: true

class QueryRecommendation < ApplicationRecord
  belongs_to :user
  belongs_to :query_product
  validates :user, uniqueness: { scope: :query_product }

end
