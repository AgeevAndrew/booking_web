# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  belongs_to :company

  scope :actives, -> { without_deleted.where(active: true) }
  scope :without_deleted, -> { where(deleted_at: nil) }
end
