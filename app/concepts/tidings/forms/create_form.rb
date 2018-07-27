# frozen_string_literal: true

require 'disposable/twin/property/hash'
require 'disposable/twin/parent'

module Tidings::Forms
  class CreateForm < Reform::Form
    include Disposable::Twin::Property::Hash
    feature Disposable::Twin::Parent

    model Tiding

    property :company_id
    property :category
    property :title
    property :body
    property :message

    validates :company_id, presence: true
    validates :category, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :message, presence:true

  end
end
