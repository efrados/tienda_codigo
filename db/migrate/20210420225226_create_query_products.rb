class CreateQueryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :query_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.text :query_text
      t.string :query_name
      t.string :query_email
      t.string :state

      t.timestamps
    end
  end
end
