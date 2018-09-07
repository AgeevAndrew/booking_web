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

    validates :id, :company_id, :category_id, :title, :description, :brief, :photo, :main_options, presence: true
  end
end
