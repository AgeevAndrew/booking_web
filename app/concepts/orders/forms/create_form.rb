# frozen_string_literal: true

require 'disposable/twin/property/hash'

module Orders::Forms
  class CreateForm < Reform::Form
    include Disposable::Twin::Property::Hash
    model Order

    property :company_id
    property :account_id
    property :address_id, virtual: true
    property :total_cost

    collection :products do
      property :id
      property :main_option

      # collection :ingridients do
      #   property :qty
      #   property :name
      #
      #   validates :qty, :name, presence: true
      #   validate :ingridient_exist
      #   def ingridient_exist
      #     return if parent.product.blank?
      #     errors.add(:name, :invalid) if parent.product_ingridients.select { |i| i[:name] == name }.blank?
      #   end
      # end

      # validates :id, :main_option, presence: true

      # validate :product_exists
      # def product_exists
      #   errors.add(:id, :invalid) if product.blank?
      # end

      # validate :main_option_exists
      # def product_valid
      #   return if product.blank?
      #   errors.add(:main_option, :invalid) if product.main_options[main_option].blank?
      # end

      # def product
      #   @product ||= Product.find_by(id: id)
      # end
      #
      # def product_ingridients
      #   @product_ingridients ||= product.additional_info
      # end
    end

    validates :company_id, presence: true
    validates :account_id, presence: true
    validates :address_id, presence: true

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
      errors.add(:address_id, :invalid) if address.blank?
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
      @address ||= Address.find_by(id: address_id)
    end
  end
end
