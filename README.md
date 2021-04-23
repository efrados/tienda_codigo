# Tienda Codigo

###### Testing
- Rspec
- Capybara
- Guards

###### Mails - Sendgrid
- Working in development for devise (Confirm and forgot password)
- Automatic mail when sent a query

###### UI
- Stimulus for: send product_query
- Bootstrap5
- Bootstrap5 Icons
- Devise views with Bootstrap 5
- Update Scaffold with Bootstrap 5
- List Products with Bootstrap 5

###### Login/Logout Users
- Devise

###### Backoffice
- Administrate

###### Model/User
- email, password, first_name, last_name

###### Model/AdminUser
- Model/user + type

###### Model/ Product
- product_name product_description product_price:decimal product_text:text fav_counter:integer query_counter:integer image:active_storage

###### Model/ QueryProduct
- user:references(optional) product:references query_text:text query_name:string query_email:string state:string

###### Model/ Favorite
- user:references product:references

## TO DO's

## Testing
- Admin only test for administrate
- Favorites
- CRUD tests for products
- Install Factories

## Models

###### QueryProduct
- answer_text:text