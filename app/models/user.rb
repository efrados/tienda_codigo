# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates_presence_of :first_name, :last_name

  has_many :query_recommendations, dependent: :destroy
  has_many :query_products, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :products, through: :favorites

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(' ')
    user = User.where(email: auth.info.email).first
    user ||= User.new(provider: auth.provider, uid: auth.uid,
                      last_name: name_split[0], first_name: name_split[1],
                      email: auth.info.email, password: Devise.friendly_token[0, 20])
    user.skip_confirmation unless user.confirmed?
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      elsif data = session['devise.google_data'] && session['devise.google_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    try(:type) == 'AdminUser'
  end

  def skip_confirmation
    skip_confirmation_notification!
    save
    confirm
  end
end
