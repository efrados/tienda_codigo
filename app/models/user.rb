# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name

  has_many :favorites, dependent: :destroy
  has_many :products, through: :favorites

  def full_name
    "#{first_name} #{last_name}"
  end
end
