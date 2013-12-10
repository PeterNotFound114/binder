class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    cannot :manage, :all

    can :read, [OrganizationAlias, OrganizationCategory, Organization, Participant, 
                ShiftType, Tool, Membership]

    can :read, Checkout do |c|
      c.organization.participants.include? (user.participant)
    end

    can :read, Organization do |o|
      o.participants.include? (user.participant)
    end

    can :read, Shift do |s|
      s.organization.participants.include? (user.participant)
    end

    can :update, Participant, :id => user.participant.id

    if user.participant.is_booth_chair?
      can :read, [ChargeType, Checkout, ContactList, Document, Faq, Shift]

      can :read, Charge do |c|
        c.organization.booth_chairs.include? (user.participant)
      end

      can :read_phone_number, Participant

      can :update, Membership do |m|
        m.organization.booth_chairs.include? (user.participant)
      end

      can :read, ShiftParticipant do |s|
        s.shift.organization.booth_chairs.include? (user.participant)
      end
    end

    if user.participant.is_scc?
      can :read, :all
      cannot :read, Role

      can [:create, :update], Charge
      can [:create, :update], Checkout
      can [:create, :update, :destroy], Membership
      can [:create, :update], Participant
      can [:create, :update], ShiftParticipant
      can :update, Task
    end

    if user.has_role? :admin
      can :manage, :all
    end
  end
end
