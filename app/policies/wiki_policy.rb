class WikiPolicy < ApplicationPolicy
  def show?
    if record.private?
      user.present? && (user.admin? || user == record.user)
    else
      true
    end
  end
  
  def index?
    true
  end
  
  def new?
    create?
  end
  
  def create?
    if record.private?
      user.present? && (user.admin? || user.premium?)
    else
      user.present?
    end
  end
  
  def edit?
    update?
  end
  
  def update?
    create?
  end
  
  def destroy?
    user.present?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end
    
    def resolve
      if user.present? && (user.admin? || user.premium?)
        scope.all
      else
        scope.where(private: false)
      end
    end
  end
end