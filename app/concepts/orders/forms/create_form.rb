# frozen_string_literal: true

require 'disposable/twin/property/hash'
require 'disposable/twin/parent'

module Orders::Forms
  class CreateForm < Reform::Form
    include Disposable::Twin::Property::Hash
    feature Disposable::Twin::Parent

    model Order

    property :company_id
    property :account_id
    property :address_id, virtual: true
    property :total_cost

    collection :order_products, populate_if_empty: OrderProduct do
      include Disposable::Twin::Property::Hash

      property :product_id
      property :main_option

      collection :ingredients, field: :hash, populate_if_empty: Hash do
        property :qty
        property :name

        validates :qty, :name, presence: true
        validate :ingridient_exist
        def ingridient_exist
          return if name.blank? || parent.product.blank?
          errors.add(:name, :invalid) if parent.product_ingredients.select { |i| i['name'] == name }.blank?
        end
      end

      validates :product_id, :main_option, presence: true

      validate :product_exists
      def product_exists
        return if product_id.blank?
        errors.add(:product_id, :invalid) if product.blank?
      end

      validate :main_option_exists
      def main_option_exists
        return if product.blank? || main_option.blank?
        errors.add(:main_option, :invalid) if product.main_options.select { |option| option['name'] == main_option }.blank?
      end

      def product
        @product ||= Product.find_by(id: product_id)
      end

      def product_ingredients
        product.additional_info
      end
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
