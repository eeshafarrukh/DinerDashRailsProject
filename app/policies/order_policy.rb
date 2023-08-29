class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present? && user.admin?
        scope.all
      elsif user.present?
        scope.where(user: user)
      else
        scope.none
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
