# Tienda Codigo

###### Testing
- Rspec
- Capybara

## TO DO's

## Security
- Devise
- Administrate?

## UI
- Install Bootstrap5
- Add Bootstrap5 Icons
- Update Scaffold HTML's to include Bootstrap
- Update Devise views to use Bootstrap 5

## Models
######Product
product_name product_description product_price:decimal
product_text:text fav_counter:integer query_counter:integer
######QueryProduct
user:references query_text:text query_name:string query_email:string state:string
######User
add first_name last_name
######Favorite
user:references product:references