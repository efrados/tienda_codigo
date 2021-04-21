class QueryProduct < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product
  validates :query_text, presence: true, length: { in: 10..200 }
  validates :query_name, presence: true, length: { in: 3..20 }, if: lambda { self.user.nil? }
  validates :query_email, presence: true, length: { in: 6..20 },
    format: { with: Devise::email_regexp }, if: lambda { self.user.nil? }
end