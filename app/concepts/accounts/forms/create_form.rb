# frozen_string_literal: true

module Accounts::Forms
  class CreateForm < Reform::Form
    include Reform::Form::ActiveRecord
    model Account

    property :id
    property :name
    property :phone
    property :email

    def phone=(value)
      super Phone.normalize(value)
    end

    validates :id, :name, :phone, :email, presence: true

    validates :phone, format: { with: Phone::REGEX }
    validates :id, format: { with: Uuid::REGEX }
    validates_uniqueness_of :id
  end
end
