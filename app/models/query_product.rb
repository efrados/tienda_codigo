# frozen_string_literal: true

class QueryProduct < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product
  validates :query_text, presence: true, length: { in: 10..200 }
  validates :query_name, presence: true, length: { in: 3..20 }, if: -> { user.nil? }
  validates :query_email, presence: true, length: { in: 6..20 },
                          format: { with: Devise.email_regexp }, if: -> { user.nil? }
  before_save :add_user_data, unless: -> { user.nil? }

  private
    def add_user_data
      self.query_name = user.full_name
      self.query_email = user.email
    end
end
