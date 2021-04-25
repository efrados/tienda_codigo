# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :query_products
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_one_attached :image

  validates :product_name, presence: true, length: { in: 5..30 }
  validates :product_description, presence: true, length: { in: 10..30 }
  validates :product_text, presence: true, length: { in: 10..200 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                                    size: { less_than: 5.megabytes,
                                    message:   "should be less than 5MB" }

  def display_image
    image.variant(gravity: 'Center', resize: '630X487^', crop: '630X487+0+0').processed
  end

  def display_image_list
    image.variant(gravity: 'Center', resize: '430X287^', crop: '430X287+0+0').processed
  end

  def display_image_mini
    image.variant(gravity: 'Center', resize: '120X100^', crop: '120X100+0+0').processed
  end

  def add_user_favorite(user)
    self.fav_counter = fav_counter + 1
    self.save
    self.users << user
  end

  def remove_user_favorite(user)
    self.fav_counter = fav_counter - 1
    self.save
    self.users.delete(user)
  end

  scope :search_bar, ->(search){ where('((LOWER(product_name) LIKE :name ) OR (LOWER(product_description) LIKE :name))',
                                        name: "%#{search.downcase}%") }
  
  def self.search(search, sort, direction)
    search ||= {}
    products = all
    products = products.search_bar(search[:search_name]) if search[:search_name].present?
    products.order("#{sort} #{direction}")
  end
end
