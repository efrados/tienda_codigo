# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      #user ||= User.new # guest user (not logged in)
      can [:show, :read], Product
    else
      alias_action :create, :read, :update, :destroy, :to => :crud

      if user.is_admin?
        can :manage, :all
      else
        can [:show, :read, :favorites], Product
        can :read, QueryProduct
        can [:destroy, :create], Favorite, Favorite do |t|
          t.user == user
        end
        can [:destroy, :create], QueryRecommendation, QueryRecommendation do |t|
          t.user == user
        end
      end
    end
  end
end
