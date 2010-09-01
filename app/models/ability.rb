class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :manage, Website, :user_id => user.id
      can :read, Response
    end
    
  end
end