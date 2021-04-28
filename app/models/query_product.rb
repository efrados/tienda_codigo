# frozen_string_literal: true

class QueryProduct < ApplicationRecord
  enum state: { no_response: nil, answered: "answered"}
  belongs_to :user, optional: true
  belongs_to :product
  validates :query_text, presence: true, length: { in: 10..200 }
  validates :query_name, presence: true, length: { in: 2..20 }, if: -> { user.nil? }
  validates :query_email, presence: true, length: { in: 6..50 },
                          format: { with: Devise.email_regexp }, if: -> { user.nil? }
  before_save :add_user_data, unless: -> { user.nil? }
  after_create :send_confirmation_query
  after_update :send_response ,if: -> { self.no_response? }

  scope :unanswered, ->(){ where(answer_text: nil) }
  scope :by_registered_users, ->(){ where.not(user: nil) }
  scope :by_unregistered_users, ->(){ where(user: nil) }
  scope :with_user, ->(user){ where(user: user) }

  scope :montly, ->(){ where('created_at >= ?', Date.today.beginning_of_month ) } 

  private
    def add_user_data
      self.query_name = user.full_name
      self.query_email = user.email
    end
  
    def send_confirmation_query
      QueryProductMailer.with(query_product: self , product: product).new_query_email.deliver_later
      product.query_counter = product.query_counter + 1
      product.save
    end

    def send_response
      QueryProductMailer.with(query_product: self , product: product).answer_email.deliver_later
      self.answered!
    end
end
