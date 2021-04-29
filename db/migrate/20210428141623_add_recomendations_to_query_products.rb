# frozen_string_literal: true

class AddRecomendationsToQueryProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :query_products, :recommended_points, :integer, null: false, default: 0
  end
end
