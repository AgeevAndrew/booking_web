# frozen_string_literal

require 'representable/json'

module Products::Representers
  class IndexRepresenter < ApplicationRepresenter
    collection :products, decorator: ProductRepresenter
    collection :categories, decorator: CategoryRepresenter
  end
end
