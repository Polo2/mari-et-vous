class WeddingPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user == record.user
  end

  def update?
    edit?
  end

  def show?
    true
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
