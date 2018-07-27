class Tiding < ApplicationRecord
  belongs_to :company

  enum category: [:promotions, :notifications, :events ]
  enum active: [:off, :on]

  def activate!
    confirmation.trigger(:activate)
  end

  def deactivate!
    confirmation.trigger(:deactivate)
  end

  def confirmation
    @confirmation ||= begin
      fsm = MicroMachine.new(0)

      fsm.when( :activate, active => 1)
      fsm.when( :deactivate, active => 0)
      fsm.on( :any) { self.active = confirmation.state }

      fsm
    end
  end

end
