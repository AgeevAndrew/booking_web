# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :company
  belongs_to :account
  belongs_to :status

  has_many :order_products, dependent: :destroy
  has_one :order_token, dependent: :destroy

  def cancel?
    status_id == Statuses::CANCELLED
  end

  def accept!
    confirmation.trigger(:accept)
  end

  def cancel!
    confirmation.trigger(:cancel)
  end

  def confirmation
    @confirmation ||= begin
      fsm = MicroMachine.new(status_id || Statuses::NEW)

      fsm.when(:accept, Statuses::NEW => Statuses::ACCEPTED)
      fsm.when(:cancel, Statuses::NEW => Statuses::CANCELLED)

      fsm.on(:any) { self.status_id = confirmation.state }

      fsm
    end
  end
end
