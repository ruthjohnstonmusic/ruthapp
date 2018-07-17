class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user not logegd in
    can :manage, User, id: user.id
  end
end
