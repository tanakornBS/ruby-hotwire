# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin
    elsif user.has_role? :modulator
      can :manage, :all
      cannot :access, :rails_admin
      cannot :destroy, Storage
    else
      can :manage, :all, user_id: user.id
      cannot :access, :rails_admin
      cannot :destroy, Storage

    end

  end
end
