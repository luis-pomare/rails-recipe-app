class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    # Define abilities for the user role
    return unless user.role == 'user'

    can :read, Food, published: true
    can :index, Food
  end
end
