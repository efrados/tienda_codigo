# frozen_string_literal: true

class QueryProduct < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product
  validates :query_text, presence: true, length: { in: 10..200 }
  validates :query_name, presence: true, length: { in: 3..20 }, if: -> { user.nil? }
  validates :query_email, presence: true, length: { in: 6..20 },
                          format: { with: Devise.email_regexp }, if: -> { user.nil? }

  def full_name
    user ? user.full_name : query_name
  end

  def email
    user ? user.email : query_email
  end
end
