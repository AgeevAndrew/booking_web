# frozen_string_literal

require 'representable/json'

module Categories::Representers
  class CategoriesRepresenter < ApplicationRepresenter
    collection :categories, decorator: CategoryRepresenter
  end
end
