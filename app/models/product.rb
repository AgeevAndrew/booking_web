class Product < ApplicationRecord
  belongs_to :category
  belongs_to :company

  scope :actives, -> { where(active: true) }
end
