class AddAnswerTextToQueryProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :query_products, :answer_text, :text
  end
end
