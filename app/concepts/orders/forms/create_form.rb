# frozen_string_literal: true

require 'disposable/twin/property/hash'

module Orders::Forms
  class CreateForm < Reform::Form
    include Disposable::Twin::Property::Hash
    model Order

    property :company_id
    property :account_id
    property :address_name
    property :total_cost

    validates :company_id, presence: true
    validates :account_id, presence: true
    validates :address_name, presence: true

    validate :company_presence
    def company_presence
      errors.add(:company_id, :invalid) if company.blank?
    end

    validate :account_presence
    def account_presence
      errors.add(:account_id, :invalid) if account.blank?
    end

    validate :address_presence
    def address_presence
      errors.add(:address_name, :invalid) if address.blank?
    end

    private

    def company
      @company ||= Company.find_by(id: company_id)
    end

    def account
      @account ||= Account.find_by(id: account_id)
    end

    def address
      return if account.blank?
      @address ||= account.addresses.select { |a| a['title'] == address_name }
    end
  end
end
