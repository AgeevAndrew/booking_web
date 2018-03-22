class Device < ApplicationRecord
  belongs_to :company
  belongs_to :account
end
