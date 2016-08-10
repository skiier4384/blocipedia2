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
    def resolve
      if user.admin? || user.premium?
        scope.all
      else
        scope.where(private: false)
      end
    end
  end
end