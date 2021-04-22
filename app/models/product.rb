# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :query_products
  has_one_attached :image
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 5.megabytes,
                                   message:   "should be less than 5MB" }

  def display_image
    image.variant(gravity: "Center", resize: "630X487^", crop: '630X487+0+0').processed
  end

  def display_image_list
    image.variant(gravity: "Center", resize: "430X287^", crop: '430X287+0+0').processed
  end
end