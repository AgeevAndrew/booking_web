# frozen_string_literal: true

module Products::Forms
  class CreateForm < Reform::Form
    model Product

    property :id
    property :company_id
    property :category_id
    property :title
    property :description
    property :brief
    property :photo
    property :main_options
    property :additional_info
    property :active

    validates :category_id, :title, :description, :brief, :main_options, presence: true
  end
end
