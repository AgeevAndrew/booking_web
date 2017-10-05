# frozen_string_literal

require 'representable/json'

module Products::Representers
  class ProductsRepresenter < ApplicationRepresenter
    collection :products, decorator: ProductRepresenter
  end
end
