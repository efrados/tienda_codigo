# frozen_string_literal: true

class CreateQueryRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :query_recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :query_product, null: false, foreign_key: true

      t.timestamps
    end
    add_index :query_recommendations, [:user_id, :query_product_id], unique: true
  end
end
