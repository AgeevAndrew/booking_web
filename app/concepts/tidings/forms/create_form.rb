# frozen_string_literal: true

module Tidings::Forms
  class CreateForm < Reform::Form

    model Tiding

    property :company_id
    property :category
    property :title
    property :body
    property :message

    validates :company_id, :category, :title, :body, :message, presence: true
    validates :category, inclusion: { in: Tiding.categories.keys }

    validate :company_presence
    def company_presence
      errors.add(:company_id, :invalid) if company.blank?
    end

    def company
      @company ||= Company.find_by(id: company_id)
    end
  end
end
