# frozen_string_literal: true

class AddAnswerTextToQueryProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :query_products, :answer_text, :text
  end
end
