# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new(email: 'efrados@gmail.com', first_name: 'Efrain', last_name: 'Arreche', password: 'asdasd')
u.skip_confirmation_notification!
u.save
u.confirm
(1..20).each do |i|
  Product.create(product_name: "product name #{i}",
                 product_description: "product small description #{i}",
                 product_text: 'product big big large description about the product in detail',
                 product_price: 10.5 + (3 * i.to_i))
end
