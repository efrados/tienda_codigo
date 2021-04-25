
require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    query_products: Field::HasMany.with_options(searchable: false),
    image:  Field::ActiveStorage.with_options(
            searchable: false,
            index_preview_size: [110, 110],
            show_preview_size: [500, 500],
    ),
    id: Field::Number.with_options(searchable: false),
    product_name: Field::String,
    product_description: Field::String,
    product_price: Field::Number.with_options(
      searchable: false,
      prefix: "$ ",
      decimals: 2,
      format: { 
          formatter: :number_to_delimited,
          formatter_options: { 
              delimiter: ',',
          },
      },
    ),
    product_text: Field::Text,
    fav_counter: Field::Number.with_options(searchable: false),
    query_counter: Field::Number.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    query_products
    product_name
    product_price
    product_description
    image
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    image
    id
    product_name
    product_description
    product_price
    product_text
    created_at
    updated_at
    fav_counter
    query_counter
    query_products
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    image
    product_name
    product_description
    product_price
    product_text
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(product)
     "#{product.product_name}"
  end
end
