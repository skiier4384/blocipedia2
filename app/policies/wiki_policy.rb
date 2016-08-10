class WikiPolicy < ApplicationPolicy
  def show?
    true
  end
  
  def index?
    true
  end
  
  def new?
    true
  end
  
  def create?
    true
  end
  
  def edit?
    true
  end
  
  def update?
    true
  end
  
  def destroy?
    true
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