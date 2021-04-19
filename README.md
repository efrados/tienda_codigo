# Tienda Codigo

###### Testing
- Rspec
- Capybara
- Guards

###### UI
- Bootstrap5

## TO DO's

## Testing
- Install Factories

## Security
- Devise
- Administrate?

## UI
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