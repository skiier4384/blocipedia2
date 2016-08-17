class WikiPolicy < ApplicationPolicy
  def show?
    true
  end
  
  def index?
    true
  end
  
  def new?
    user.present?
  end
  
  def create?
    new?
  end
  
  def edit?
    user.present?
  end
  
  def update?
    edit?
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