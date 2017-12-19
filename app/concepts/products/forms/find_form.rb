# frozen_string_literal: true

module Products::Forms
  class FindForm < Reform::Form
    property :company_id, virtual: true
    property :category_id, virtual: true
  end
end
