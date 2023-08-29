class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user&.admin?
  end

  def create?
    new?
  end

  def edit?
    user&.admin?
  end

  def update?
    edit?
  end

  def destroy?
    user&.admin?
  end

  def assign_categories?
    edit?
  end
end
