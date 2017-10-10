# frozen_string_literal: true

class ApplicationPolicy
  class NotAuthenticatedError < StandardError; end
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  private

  def raise_not_authenticated
    raise ApplicationPolicy::NotAuthenticatedError
  end
end
