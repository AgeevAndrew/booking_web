# frozen_string_literal: true

module Store::Facades
  class ProductsFacade < BaseFacade
    def categories
      Category.where(id: products.map(&:category_id)).all
    end

    def addresses
      Address.where(id: companies.map(&:address_ids).flatten).all
    end

    def products
      Product.where(company_id: companies.map(&:id)).all
    end
  end
end
