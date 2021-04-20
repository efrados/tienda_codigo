class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.string :product_description, null: false
      t.decimal :product_price, null: false, default: 0, precision: 10, scale: 2
      t.text :product_text, null: false
      t.integer :fav_counter, null: false, default: 0
      t.integer :query_counter, null: false, default: 0

      t.timestamps
    end
  end
end
