class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def user_show?
    user.present? && (record.user == user)
  end

  def admin_show?
    user.present? && user.admin?
  end
  def cancel?
    user.admin? || (user.present? && record.user == user)
  end
  def mark_as_paid?
    user.admin? || (user.present? && record.user == user)
  end
  def mark_as_completed?
    user.admin? || (user.present? && record.user == user)
  end
end
