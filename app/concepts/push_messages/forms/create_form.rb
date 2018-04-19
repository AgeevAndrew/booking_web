# frozen_string_literal: true

module PushMessages::Forms
  class CreateForm < Reform::Form
    model PushMessage

    property :company_id
    property :title
    property :body
    property :success
    property :failure

    validates :company_id, :title, :body, :success, :failure, presence: true
  end
end
